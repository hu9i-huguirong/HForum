package com.example.hforum.utils;

import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.Properties;
import java.util.Timer;
import java.util.TimerTask;

/**
 * 邮件发送工具类
 */
public class EmailUtil {

    // 发件人的 邮箱 和 密码（替换为自己的邮箱和密码）
    // PS: 某些邮箱服务器为了增加邮箱本身密码的安全性，给 SMTP 客户端设置了独立密码（有的邮箱称为“授权码”）,
    //     对于开启了独立密码的邮箱, 这里的邮箱密码必需使用这个独立密码（授权码）。
    public static String myEmailAccount = "1796894391@qq.com";
    public static String myEmailPassword = "mtshvnbutozkejdj";

    // 发件人邮箱的 SMTP 服务器地址, 必须准确, 不同邮件服务器地址不同, 一般(只是一般, 绝非绝对)格式为: smtp.xxx.com
    // 网易163邮箱的 SMTP 服务器地址为: smtp.163.com
    public static String myEmailSMTPHost = "smtp.qq.com";

    /**
     * 发送邮件的方法
     *
     * @param receiveMailAccount :收件人
     * @param activateKey        :激活码
     */
    public static void sendMail(String receiveMailAccount, String activateKey) throws Exception {
        // 1. 创建参数配置, 用于连接邮件服务器的参数配置
        Properties props = new Properties();                    // 参数配置
        props.setProperty("mail.transport.protocol", "smtp");   // 使用的协议（JavaMail规范要求）
        props.setProperty("mail.smtp.host", myEmailSMTPHost);   // 发件人的邮箱的 SMTP 服务器地址
        props.setProperty("mail.smtp.auth", "true");            // 需要请求认证

        // 2. 根据配置创建会话对象, 用于和邮件服务器交互
        Session session = Session.getInstance(props);
        session.setDebug(true);                                 // 设置为debug模式, 可以查看详细的发送 log

        // PS: 某些邮箱服务器要求 SMTP 连接需要使用 SSL 安全认证 (为了提高安全性, 邮箱支持SSL连接, 也可以自己开启),
        //     如果无法连接邮件服务器, 仔细查看控制台打印的 log, 如果有有类似 “连接失败, 要求 SSL 安全连接” 等错误,
        //     打开下面 /* ... */ 之间的注释代码, 开启 SSL 安全连接。

        // SMTP 服务器的端口 (非 SSL 连接的端口一般默认为 25, 可以不添加, 如果开启了 SSL 连接,
        //                  需要改为对应邮箱的 SMTP 服务器的端口, 具体可查看对应邮箱服务的帮助,
        //                  QQ邮箱的SMTP(SLL)端口为465或587, 其他邮箱自行去查看)
        final String smtpPort = "465";
        props.setProperty("mail.smtp.port", smtpPort);
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.socketFactory.port", smtpPort);

        // 3. 创建一封邮件
        MimeMessage message = createMimeMessage(session, myEmailAccount, receiveMailAccount, activateKey);

        // 4. 根据 Session 获取邮件传输对象
        Transport transport = session.getTransport();
        // 5. 使用 邮箱账号 和 密码 连接邮件服务器, 这里认证的邮箱必须与 message 中的发件人邮箱一致, 否则报错
        transport.connect(myEmailAccount, myEmailPassword);

        // 6. 发送邮件, 发到所有的收件地址, message.getAllRecipients() 获取到的是在创建邮件对象时添加的所有收件人, 抄送人, 密送人
        transport.sendMessage(message, message.getAllRecipients());
        // 7. 关闭连接
        transport.close();
    }


    /**
     * 创建一封只包含文本的简单邮件
     *
     * @param session     和服务器交互的会话
     * @param sendMail    发件人邮箱
     * @param receiveMail 收件人邮箱
     * @return
     * @throws Exception
     */
    public static MimeMessage createMimeMessage(Session session, String sendMail, String receiveMail, String activateKey) throws Exception {
        // 1. 创建一封邮件
        MimeMessage message = new MimeMessage(session);

        // 2. From: 发件人（昵称有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改昵称）
        message.setFrom(new InternetAddress(sendMail));

        // 3. To: 收件人（可以增加多个收件人、抄送、密送）
        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(receiveMail));

        // 4. Subject: 邮件主题（标题有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改标题）
        message.setSubject("【HForum】帐号激活邮件", "UTF-8");

        // 5. Content: 邮件正文（可以使用html标签）（内容有广告嫌疑，避免被邮件服务器误认为是滥发广告以至返回失败，请修改发送内容）
        message.setContent(registerActivateEmailHtml(receiveMail, activateKey), "text/html;charset=UTF-8");

        // 6. 设置发件时间
        message.setSentDate(new Date());

        // 7. 保存设置
        message.saveChanges();

        return message;
    }

    public static String registerActivateEmailHtml(String userName, String activateKey) {
        String html = "<p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">亲爱的" + userName + "，</span></p>";
        html += "<p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">&nbsp; &nbsp; &nbsp; &nbsp;  欢迎加入HForum,您的账户离激活还差最后一步。</span> &nbsp;";
        html += "&nbsp;<span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">&nbsp; &nbsp; &nbsp; &nbsp; </span></p>";
        html += "<p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">&nbsp; &nbsp; &nbsp; &nbsp; 请点击下面的链接来激活您的帐号，</span>&nbsp;<br></p>";
        html += "<p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\"> 链接：</span>";
        html += "<a href=\"http://localhost:8080/user/register/activate?activateKey=" + activateKey + "\" style=\"font-family: 楷体, 楷体_GB2312, SimKai;\" target=\"_blank\">";
        html += "http://localhost:8080/user/register/activate?activateKey=" + activateKey + "</a></p><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">&nbsp; &nbsp; &nbsp; &nbsp;（如果您的邮箱不支持链接点击，请将以上链接地址拷贝到您的浏览器地址栏中激活。）</span>&nbsp;<br></p>";
        html += "<p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">------------------------------------------------------------------------------------</span>&nbsp;<br></p>";
        html += "<p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">&nbsp; &nbsp; &nbsp; &nbsp;链接10分钟内有效，若非本人操作，请忽略此邮件。感谢您的访问，祝您使用愉快！</span></p>";
        html += "<p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\"> HForum团队 </span><a href=\"http://localhost:8080\" style=\"font-family: 楷体, 楷体_GB2312, SimKai;\" target=\"_blank\">http://localhost:8080</a></p>";
        html += "<br/><p><span style=\"font-family: 楷体, 楷体_GB2312, SimKai;\">&nbsp; &nbsp; &nbsp; &nbsp;此邮件为系统自动发出，请勿直接回复。</span></p>";
        return html;
    }

    public static void schedule(String receiveMailAccount, final HttpSession session, String activateKey) throws Exception {

        Timer t = (Timer) session.getAttribute("timer");
        if (t != null) {
            t.cancel();
            session.removeAttribute("timer");
            String k = (String) session.getAttribute("activateKey");
            if (k != null) {
                session.removeAttribute("activateKey");
            }
        }

        session.setAttribute("activateKey", activateKey);//把激活码放入session
        sendMail(receiveMailAccount, activateKey);//调用发送邮箱的方法，给用户发送邮件
        final Timer timer = new Timer();//定时器，验证码10分钟之内没有点击链接进入就失效
        timer.schedule(new TimerTask() {
            public void run() {
                session.removeAttribute("activateKey");
                timer.cancel();
            }
        }, 1000 * 60 * 10);// 设定指定的时间time,此处为10分钟
        session.setAttribute("timer", timer);
    }


    public static void main(String[] args) throws Exception {
        sendMail("2944852891@qq.com", IDUtil.createUUID(false));
        System.out.println("OK");
    }
}
