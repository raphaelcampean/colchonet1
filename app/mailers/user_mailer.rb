class UserMailer< ApplicationMailer
    def simple_message(recipient)
      attachments["attachment.pdf"] = File.read("path/to/file.pdf")
      mail(
        to: “your@bestuserever.com”,
        subject: "New account information",
        content_type: "text/html",
        body: "<html><strong>Hello there</strong></html>"
      )
    end
end