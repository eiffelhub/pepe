class SMTPLIB_SMTP

inherit
   PYTHON_WRAPPER_CLASS

create
   from_init,
   borrowed,
   new

feature

   module_name : STRING  once Result := "smtplib" end;

   py_class_name : STRING  once Result := "SMTP" end;

   set_debuglevel( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- Set the debug output level.
        --
        --         A non-false value results in debug messages for connection and for all
        --         messages sent to and received from the server.
        --
        --
      do
          Result := call_method ( "set_debuglevel", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   set_debuglevel_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- Set the debug output level.
        --
        --         A non-false value results in debug messages for connection and for all
        --         messages sent to and received from the server.
        --
        --
      do
          Result := call_method ( "set_debuglevel", args )
      end

   connect( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- Connect to a host on a given port.
        --
        --         If the hostname ends with a colon (`:') followed by a number, and
        --         there is no port specified, that suffix will be stripped off and the
        --         number interpreted as the port number to use.
        --
        --         Note: This method is automatically invoked by __init__, if a host is
        --         specified during instantiation.
        --
        --
      do
          Result := call_method ( "connect", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   connect_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- Connect to a host on a given port.
        --
        --         If the hostname ends with a colon (`:') followed by a number, and
        --         there is no port specified, that suffix will be stripped off and the
        --         number interpreted as the port number to use.
        --
        --         Note: This method is automatically invoked by __init__, if a host is
        --         specified during instantiation.
        --
        --
      do
          Result := call_method ( "connect", args )
      end

   send( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- Send `s' to the server.
      do
          Result := call_method ( "send", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   send_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- Send `s' to the server.
      do
          Result := call_method ( "send", args )
      end

   putcmd( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- Send a command to the server.
      do
          Result := call_method ( "putcmd", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   putcmd_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- Send a command to the server.
      do
          Result := call_method ( "putcmd", args )
      end

   getreply : PYTHON_OBJECT
        -- Get a reply from the server.
        --
        --         Returns a tuple consisting of:
        --
        --           - server response code (e.g. '250', or such, if all goes well)
        --             Note: returns -1 if it can't read response code.
        --
        --           - server response string corresponding to response code (multiline
        --             responses are converted to a single, multiline string).
        --
        --         Raises SMTPServerDisconnected if end-of-file is reached.
        --
      do
          Result := call_method ( "getreply", Void )
      end

   getreply_python : PYTHON_OBJECT
        -- Get a reply from the server.
        --
        --         Returns a tuple consisting of:
        --
        --           - server response code (e.g. '250', or such, if all goes well)
        --             Note: returns -1 if it can't read response code.
        --
        --           - server response string corresponding to response code (multiline
        --             responses are converted to a single, multiline string).
        --
        --         Raises SMTPServerDisconnected if end-of-file is reached.
        --
      do
          Result := call_method ( "getreply", Void )
      end

   docmd( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- Send a command, and return its response code.
      do
          Result := call_method ( "docmd", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   docmd_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- Send a command, and return its response code.
      do
          Result := call_method ( "docmd", args )
      end

   helo( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- SMTP 'helo' command.
        --         Hostname to send for this command defaults to the FQDN of the local
        --         host.
        --
      do
          Result := call_method ( "helo", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   helo_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- SMTP 'helo' command.
        --         Hostname to send for this command defaults to the FQDN of the local
        --         host.
        --
      do
          Result := call_method ( "helo", args )
      end

   ehlo( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        --  SMTP 'ehlo' command.
        --         Hostname to send for this command defaults to the FQDN of the local
        --         host.
        --
      do
          Result := call_method ( "ehlo", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   ehlo_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        --  SMTP 'ehlo' command.
        --         Hostname to send for this command defaults to the FQDN of the local
        --         host.
        --
      do
          Result := call_method ( "ehlo", args )
      end

   has_extn( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- Does the server support a given SMTP service extension?
      do
          Result := call_method ( "has_extn", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   has_extn_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- Does the server support a given SMTP service extension?
      do
          Result := call_method ( "has_extn", args )
      end

   help( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- SMTP 'help' command.
        --         Returns help text from server.
      do
          Result := call_method ( "help", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   help_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- SMTP 'help' command.
        --         Returns help text from server.
      do
          Result := call_method ( "help", args )
      end

   rset : PYTHON_OBJECT
        -- SMTP 'rset' command -- resets session.
      do
          Result := call_method ( "rset", Void )
      end

   rset_python : PYTHON_OBJECT
        -- SMTP 'rset' command -- resets session.
      do
          Result := call_method ( "rset", Void )
      end

   noop : PYTHON_OBJECT
        -- SMTP 'noop' command -- doesn't do anything :>
      do
          Result := call_method ( "noop", Void )
      end

   noop_python : PYTHON_OBJECT
        -- SMTP 'noop' command -- doesn't do anything :>
      do
          Result := call_method ( "noop", Void )
      end

   mail( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- SMTP 'mail' command -- begins mail xfer session.
        --
        --         This method may raise the following exceptions:
        --
        --          SMTPNotSupportedError  The options parameter includes 'SMTPUTF8'
        --                                 but the SMTPUTF8 extension is not supported by
        --                                 the server.
        --
      do
          Result := call_method ( "mail", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   mail_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- SMTP 'mail' command -- begins mail xfer session.
        --
        --         This method may raise the following exceptions:
        --
        --          SMTPNotSupportedError  The options parameter includes 'SMTPUTF8'
        --                                 but the SMTPUTF8 extension is not supported by
        --                                 the server.
        --
      do
          Result := call_method ( "mail", args )
      end

   rcpt( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- SMTP 'rcpt' command -- indicates 1 recipient for this mail.
      do
          Result := call_method ( "rcpt", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   rcpt_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- SMTP 'rcpt' command -- indicates 1 recipient for this mail.
      do
          Result := call_method ( "rcpt", args )
      end

   data( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- SMTP 'DATA' command -- sends message data to server.
        --
        --         Automatically quotes lines beginning with a period per rfc821.
        --         Raises SMTPDataError if there is an unexpected reply to the
        --         DATA command; the return value from this method is the final
        --         response code received when the all data is sent.  If msg
        --         is a string, lone '\r' and '\n' characters are converted to
        --         '\r\n' characters.  If msg is bytes, it is transmitted as is.
        --
      do
          Result := call_method ( "data", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   data_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- SMTP 'DATA' command -- sends message data to server.
        --
        --         Automatically quotes lines beginning with a period per rfc821.
        --         Raises SMTPDataError if there is an unexpected reply to the
        --         DATA command; the return value from this method is the final
        --         response code received when the all data is sent.  If msg
        --         is a string, lone '\r' and '\n' characters are converted to
        --         '\r\n' characters.  If msg is bytes, it is transmitted as is.
        --
      do
          Result := call_method ( "data", args )
      end

   verify( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- SMTP 'verify' command -- checks for address validity.
      do
          Result := call_method ( "verify", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   verify_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- SMTP 'verify' command -- checks for address validity.
      do
          Result := call_method ( "verify", args )
      end

   vrfy( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- SMTP 'verify' command -- checks for address validity.
      do
          Result := call_method ( "verify", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   vrfy_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- SMTP 'verify' command -- checks for address validity.
      do
          Result := call_method ( "verify", args )
      end

   expn( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- SMTP 'expn' command -- expands a mailing list.
      do
          Result := call_method ( "expn", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   expn_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- SMTP 'expn' command -- expands a mailing list.
      do
          Result := call_method ( "expn", args )
      end

   ehlo_or_helo_if_needed : PYTHON_OBJECT
        -- Call self.ehlo() and/or self.helo() if needed.
        --
        --         If there has been no previous EHLO or HELO command this session, this
        --         method tries ESMTP EHLO first.
        --
        --         This method may raise the following exceptions:
        --
        --          SMTPHeloError            The server didn't reply properly to
        --                                   the helo greeting.
        --
      do
          Result := call_method ( "ehlo_or_helo_if_needed", Void )
      end

   ehlo_or_helo_if_needed_python : PYTHON_OBJECT
        -- Call self.ehlo() and/or self.helo() if needed.
        --
        --         If there has been no previous EHLO or HELO command this session, this
        --         method tries ESMTP EHLO first.
        --
        --         This method may raise the following exceptions:
        --
        --          SMTPHeloError            The server didn't reply properly to
        --                                   the helo greeting.
        --
      do
          Result := call_method ( "ehlo_or_helo_if_needed", Void )
      end

   auth( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- Authentication command - requires response processing.
        --
        --         'mechanism' specifies which authentication mechanism is to
        --         be used - the valid values are those listed in the 'auth'
        --         element of 'esmtp_features'.
        --
        --         'authobject' must be a callable object taking a single argument:
        --
        --                 data = authobject(challenge)
        --
        --         It will be called to process the server's challenge response; the
        --         challenge argument it is passed will be a bytes.  It should return
        --         an ASCII string that will be base64 encoded and sent to the server.
        --
        --         Keyword arguments:
        --             - initial_response_ok: Allow sending the RFC 4954 initial-response
        --               to the AUTH command, if the authentication methods supports it.
        --
      do
          Result := call_method ( "auth", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   auth_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- Authentication command - requires response processing.
        --
        --         'mechanism' specifies which authentication mechanism is to
        --         be used - the valid values are those listed in the 'auth'
        --         element of 'esmtp_features'.
        --
        --         'authobject' must be a callable object taking a single argument:
        --
        --                 data = authobject(challenge)
        --
        --         It will be called to process the server's challenge response; the
        --         challenge argument it is passed will be a bytes.  It should return
        --         an ASCII string that will be base64 encoded and sent to the server.
        --
        --         Keyword arguments:
        --             - initial_response_ok: Allow sending the RFC 4954 initial-response
        --               to the AUTH command, if the authentication methods supports it.
        --
      do
          Result := call_method ( "auth", args )
      end

   auth_cram_md5( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        --  Authobject to use with CRAM-MD5 authentication. Requires self.user
        --         and self.password to be set.
      do
          Result := call_method ( "auth_cram_md5", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   auth_cram_md5_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        --  Authobject to use with CRAM-MD5 authentication. Requires self.user
        --         and self.password to be set.
      do
          Result := call_method ( "auth_cram_md5", args )
      end

   auth_plain( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        --  Authobject to use with PLAIN authentication. Requires self.user and
        --         self.password to be set.
      do
          Result := call_method ( "auth_plain", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   auth_plain_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        --  Authobject to use with PLAIN authentication. Requires self.user and
        --         self.password to be set.
      do
          Result := call_method ( "auth_plain", args )
      end

   auth_login( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        --  Authobject to use with LOGIN authentication. Requires self.user and
        --         self.password to be set.
      do
          Result := call_method ( "auth_login", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   auth_login_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        --  Authobject to use with LOGIN authentication. Requires self.user and
        --         self.password to be set.
      do
          Result := call_method ( "auth_login", args )
      end

   login( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- Log in on an SMTP server that requires authentication.
        --
        --         The arguments are:
        --             - user:         The user name to authenticate with.
        --             - password:     The password for the authentication.
        --
        --         Keyword arguments:
        --             - initial_response_ok: Allow sending the RFC 4954 initial-response
        --               to the AUTH command, if the authentication methods supports it.
        --
        --         If there has been no previous EHLO or HELO command this session, this
        --         method tries ESMTP EHLO first.
        --
        --         This method will return normally if the authentication was successful.
        --
        --         This method may raise the following exceptions:
        --
        --          SMTPHeloError            The server didn't reply properly to
        --                                   the helo greeting.
        --          SMTPAuthenticationError  The server didn't accept the username/
        --                                   password combination.
        --          SMTPNotSupportedError    The AUTH command is not supported by the
        --                                   server.
        --          SMTPException            No suitable authentication method was
        --                                   found.
        --
      do
          Result := call_method ( "login", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   login_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- Log in on an SMTP server that requires authentication.
        --
        --         The arguments are:
        --             - user:         The user name to authenticate with.
        --             - password:     The password for the authentication.
        --
        --         Keyword arguments:
        --             - initial_response_ok: Allow sending the RFC 4954 initial-response
        --               to the AUTH command, if the authentication methods supports it.
        --
        --         If there has been no previous EHLO or HELO command this session, this
        --         method tries ESMTP EHLO first.
        --
        --         This method will return normally if the authentication was successful.
        --
        --         This method may raise the following exceptions:
        --
        --          SMTPHeloError            The server didn't reply properly to
        --                                   the helo greeting.
        --          SMTPAuthenticationError  The server didn't accept the username/
        --                                   password combination.
        --          SMTPNotSupportedError    The AUTH command is not supported by the
        --                                   server.
        --          SMTPException            No suitable authentication method was
        --                                   found.
        --
      do
          Result := call_method ( "login", args )
      end

   starttls( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- Puts the connection to the SMTP server into TLS mode.
        --
        --         If there has been no previous EHLO or HELO command this session, this
        --         method tries ESMTP EHLO first.
        --
        --         If the server supports TLS, this will encrypt the rest of the SMTP
        --         session. If you provide the keyfile and certfile parameters,
        --         the identity of the SMTP server and client can be checked. This,
        --         however, depends on whether the socket module really checks the
        --         certificates.
        --
        --         This method may raise the following exceptions:
        --
        --          SMTPHeloError            The server didn't reply properly to
        --                                   the helo greeting.
        --
      do
          Result := call_method ( "starttls", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   starttls_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- Puts the connection to the SMTP server into TLS mode.
        --
        --         If there has been no previous EHLO or HELO command this session, this
        --         method tries ESMTP EHLO first.
        --
        --         If the server supports TLS, this will encrypt the rest of the SMTP
        --         session. If you provide the keyfile and certfile parameters,
        --         the identity of the SMTP server and client can be checked. This,
        --         however, depends on whether the socket module really checks the
        --         certificates.
        --
        --         This method may raise the following exceptions:
        --
        --          SMTPHeloError            The server didn't reply properly to
        --                                   the helo greeting.
        --
      do
          Result := call_method ( "starttls", args )
      end

   sendmail( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- This command performs an entire mail transaction.
        --
        --         The arguments are:
        --             - from_addr    : The address sending this mail.
        --             - to_addrs     : A list of addresses to send this mail to.  A bare
        --                              string will be treated as a list with 1 address.
        --             - msg          : The message to send.
        --             - mail_options : List of ESMTP options (such as 8bitmime) for the
        --                              mail command.
        --             - rcpt_options : List of ESMTP options (such as DSN commands) for
        --                              all the rcpt commands.
        --
        --         msg may be a string containing characters in the ASCII range, or a byte
        --         string.  A string is encoded to bytes using the ascii codec, and lone
        --         \r and \n characters are converted to \r\n characters.
        --
        --         If there has been no previous EHLO or HELO command this session, this
        --         method tries ESMTP EHLO first.  If the server does ESMTP, message size
        --         and each of the specified options will be passed to it.  If EHLO
        --         fails, HELO will be tried and ESMTP options suppressed.
        --
        --         This method will return normally if the mail is accepted for at least
        --         one recipient.  It returns a dictionary, with one entry for each
        --         recipient that was refused.  Each entry contains a tuple of the SMTP
        --         error code and the accompanying error message sent by the server.
        --
        --         This method may raise the following exceptions:
        --
        --          SMTPHeloError          The server didn't reply properly to
        --                                 the helo greeting.
        --          SMTPRecipientsRefused  The server rejected ALL recipients
        --                                 (no mail was sent).
        --          SMTPSenderRefused      The server didn't accept the from_addr.
        --          SMTPDataError          The server replied with an unexpected
        --                                 error code (other than a refusal of
        --                                 a recipient).
        --          SMTPNotSupportedError  The mail_options parameter includes 'SMTPUTF8'
        --                                 but the SMTPUTF8 extension is not supported by
        --                                 the server.
        --
        --         Note: the connection will be open even after an exception is raised.
        --
        --         Example:
        --
        --          >>> import smtplib
        --          >>> s=smtplib.SMTP("localhost")
        --          >>> tolist=["one@one.org","two@two.org","three@three.org","four@four.org"]
        --          >>> msg = '''\
        --          ... From: Me@my.org
        --          ... Subject: testin'...
        --          ...
        --          ... This is a test '''
        --          >>> s.sendmail("me@my.org",tolist,msg)
        --          { "three@three.org" : ( 550 ,"User unknown" ) }
        --          >>> s.quit()
        --
        --         In the above example, the message was accepted for delivery to three
        --         of the four addresses, and one was rejected, with the error code
        --         550.  If all addresses are accepted, then the method will return an
        --         empty dictionary.
        --
        --
      do
          Result := call_method ( "sendmail", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   sendmail_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- This command performs an entire mail transaction.
        --
        --         The arguments are:
        --             - from_addr    : The address sending this mail.
        --             - to_addrs     : A list of addresses to send this mail to.  A bare
        --                              string will be treated as a list with 1 address.
        --             - msg          : The message to send.
        --             - mail_options : List of ESMTP options (such as 8bitmime) for the
        --                              mail command.
        --             - rcpt_options : List of ESMTP options (such as DSN commands) for
        --                              all the rcpt commands.
        --
        --         msg may be a string containing characters in the ASCII range, or a byte
        --         string.  A string is encoded to bytes using the ascii codec, and lone
        --         \r and \n characters are converted to \r\n characters.
        --
        --         If there has been no previous EHLO or HELO command this session, this
        --         method tries ESMTP EHLO first.  If the server does ESMTP, message size
        --         and each of the specified options will be passed to it.  If EHLO
        --         fails, HELO will be tried and ESMTP options suppressed.
        --
        --         This method will return normally if the mail is accepted for at least
        --         one recipient.  It returns a dictionary, with one entry for each
        --         recipient that was refused.  Each entry contains a tuple of the SMTP
        --         error code and the accompanying error message sent by the server.
        --
        --         This method may raise the following exceptions:
        --
        --          SMTPHeloError          The server didn't reply properly to
        --                                 the helo greeting.
        --          SMTPRecipientsRefused  The server rejected ALL recipients
        --                                 (no mail was sent).
        --          SMTPSenderRefused      The server didn't accept the from_addr.
        --          SMTPDataError          The server replied with an unexpected
        --                                 error code (other than a refusal of
        --                                 a recipient).
        --          SMTPNotSupportedError  The mail_options parameter includes 'SMTPUTF8'
        --                                 but the SMTPUTF8 extension is not supported by
        --                                 the server.
        --
        --         Note: the connection will be open even after an exception is raised.
        --
        --         Example:
        --
        --          >>> import smtplib
        --          >>> s=smtplib.SMTP("localhost")
        --          >>> tolist=["one@one.org","two@two.org","three@three.org","four@four.org"]
        --          >>> msg = '''\
        --          ... From: Me@my.org
        --          ... Subject: testin'...
        --          ...
        --          ... This is a test '''
        --          >>> s.sendmail("me@my.org",tolist,msg)
        --          { "three@three.org" : ( 550 ,"User unknown" ) }
        --          >>> s.quit()
        --
        --         In the above example, the message was accepted for delivery to three
        --         of the four addresses, and one was rejected, with the error code
        --         550.  If all addresses are accepted, then the method will return an
        --         empty dictionary.
        --
        --
      do
          Result := call_method ( "sendmail", args )
      end

   send_message( args : ARRAY[ ANY ] ) : PYTHON_OBJECT
        -- Converts message to a bytestring and passes it to sendmail.
        --
        --         The arguments are as for sendmail, except that msg is an
        --         email.message.Message object.  If from_addr is None or to_addrs is
        --         None, these arguments are taken from the headers of the Message as
        --         described in RFC 2822 (a ValueError is raised if there is more than
        --         one set of 'Resent-' headers).  Regardless of the values of from_addr and
        --         to_addr, any Bcc field (or Resent-Bcc field, when the Message is a
        --         resent) of the Message object won't be transmitted.  The Message
        --         object is then serialized using email.generator.BytesGenerator and
        --         sendmail is called to transmit the message.  If the sender or any of
        --         the recipient addresses contain non-ASCII and the server advertises the
        --         SMTPUTF8 capability, the policy is cloned with utf8 set to True for the
        --         serialization, and SMTPUTF8 and BODY=8BITMIME are asserted on the send.
        --         If the server does not support SMTPUTF8, an SMTPNotSupported error is
        --         raised.  Otherwise the generator is called without modifying the
        --         policy.
        --
        --
      do
          Result := call_method ( "send_message", {PYTHON_OBJECT_FACTORY}.new_python_tuple( args ) )
      end

   send_message_python( args : PYTHON_TUPLE ) : PYTHON_OBJECT
        -- Converts message to a bytestring and passes it to sendmail.
        --
        --         The arguments are as for sendmail, except that msg is an
        --         email.message.Message object.  If from_addr is None or to_addrs is
        --         None, these arguments are taken from the headers of the Message as
        --         described in RFC 2822 (a ValueError is raised if there is more than
        --         one set of 'Resent-' headers).  Regardless of the values of from_addr and
        --         to_addr, any Bcc field (or Resent-Bcc field, when the Message is a
        --         resent) of the Message object won't be transmitted.  The Message
        --         object is then serialized using email.generator.BytesGenerator and
        --         sendmail is called to transmit the message.  If the sender or any of
        --         the recipient addresses contain non-ASCII and the server advertises the
        --         SMTPUTF8 capability, the policy is cloned with utf8 set to True for the
        --         serialization, and SMTPUTF8 and BODY=8BITMIME are asserted on the send.
        --         If the server does not support SMTPUTF8, an SMTPNotSupported error is
        --         raised.  Otherwise the generator is called without modifying the
        --         policy.
        --
        --
      do
          Result := call_method ( "send_message", args )
      end

   close : PYTHON_OBJECT
        -- Close the connection to the SMTP server.
      do
          Result := call_method ( "close", Void )
      end

   close_python : PYTHON_OBJECT
        -- Close the connection to the SMTP server.
      do
          Result := call_method ( "close", Void )
      end

   quit : PYTHON_OBJECT
        -- Terminate the SMTP session.
      do
          Result := call_method ( "quit", Void )
      end

   quit_python : PYTHON_OBJECT
        -- Terminate the SMTP session.
      do
          Result := call_method ( "quit", Void )
      end

   debuglevel: PYTHON_OBJECT
        -- str(object='') -> str
        -- str(bytes_or_buffer[, encoding[, errors]]) -> str
        --
        -- Create a new string object from the given object. If encoding or
        -- errors is specified, then the object must expose a data buffer
        -- that will be decoded using the given encoding and error handler.
        -- Otherwise, returns the result of object.__str__() (if defined)
        -- or repr(object).
        -- encoding defaults to sys.getdefaultencoding().
        -- errors defaults to 'strict'.
      require
         has_attribute ( "debuglevel" )
      do
         Result := attribute_value( "debuglevel" )
      end

   sock: PYTHON_OBJECT
        -- str(object='') -> str
        -- str(bytes_or_buffer[, encoding[, errors]]) -> str
        --
        -- Create a new string object from the given object. If encoding or
        -- errors is specified, then the object must expose a data buffer
        -- that will be decoded using the given encoding and error handler.
        -- Otherwise, returns the result of object.__str__() (if defined)
        -- or repr(object).
        -- encoding defaults to sys.getdefaultencoding().
        -- errors defaults to 'strict'.
      require
         has_attribute ( "sock" )
      do
         Result := attribute_value( "sock" )
      end

   file: PYTHON_OBJECT
        -- str(object='') -> str
        -- str(bytes_or_buffer[, encoding[, errors]]) -> str
        --
        -- Create a new string object from the given object. If encoding or
        -- errors is specified, then the object must expose a data buffer
        -- that will be decoded using the given encoding and error handler.
        -- Otherwise, returns the result of object.__str__() (if defined)
        -- or repr(object).
        -- encoding defaults to sys.getdefaultencoding().
        -- errors defaults to 'strict'.
      require
         has_attribute ( "file" )
      do
         Result := attribute_value( "file" )
      end

   helo_resp: PYTHON_OBJECT
        -- str(object='') -> str
        -- str(bytes_or_buffer[, encoding[, errors]]) -> str
        --
        -- Create a new string object from the given object. If encoding or
        -- errors is specified, then the object must expose a data buffer
        -- that will be decoded using the given encoding and error handler.
        -- Otherwise, returns the result of object.__str__() (if defined)
        -- or repr(object).
        -- encoding defaults to sys.getdefaultencoding().
        -- errors defaults to 'strict'.
      require
         has_attribute ( "helo_resp" )
      do
         Result := attribute_value( "helo_resp" )
      end

   ehlo_msg: PYTHON_OBJECT
        -- str(object='') -> str
        -- str(bytes_or_buffer[, encoding[, errors]]) -> str
        --
        -- Create a new string object from the given object. If encoding or
        -- errors is specified, then the object must expose a data buffer
        -- that will be decoded using the given encoding and error handler.
        -- Otherwise, returns the result of object.__str__() (if defined)
        -- or repr(object).
        -- encoding defaults to sys.getdefaultencoding().
        -- errors defaults to 'strict'.
      require
         has_attribute ( "ehlo_msg" )
      do
         Result := attribute_value( "ehlo_msg" )
      end

   ehlo_resp: PYTHON_OBJECT
        -- str(object='') -> str
        -- str(bytes_or_buffer[, encoding[, errors]]) -> str
        --
        -- Create a new string object from the given object. If encoding or
        -- errors is specified, then the object must expose a data buffer
        -- that will be decoded using the given encoding and error handler.
        -- Otherwise, returns the result of object.__str__() (if defined)
        -- or repr(object).
        -- encoding defaults to sys.getdefaultencoding().
        -- errors defaults to 'strict'.
      require
         has_attribute ( "ehlo_resp" )
      do
         Result := attribute_value( "ehlo_resp" )
      end

   does_esmtp: PYTHON_OBJECT
        -- str(object='') -> str
        -- str(bytes_or_buffer[, encoding[, errors]]) -> str
        --
        -- Create a new string object from the given object. If encoding or
        -- errors is specified, then the object must expose a data buffer
        -- that will be decoded using the given encoding and error handler.
        -- Otherwise, returns the result of object.__str__() (if defined)
        -- or repr(object).
        -- encoding defaults to sys.getdefaultencoding().
        -- errors defaults to 'strict'.
      require
         has_attribute ( "does_esmtp" )
      do
         Result := attribute_value( "does_esmtp" )
      end

   default_port: PYTHON_OBJECT
        -- str(object='') -> str
        -- str(bytes_or_buffer[, encoding[, errors]]) -> str
        --
        -- Create a new string object from the given object. If encoding or
        -- errors is specified, then the object must expose a data buffer
        -- that will be decoded using the given encoding and error handler.
        -- Otherwise, returns the result of object.__str__() (if defined)
        -- or repr(object).
        -- encoding defaults to sys.getdefaultencoding().
        -- errors defaults to 'strict'.
      require
         has_attribute ( "default_port" )
      do
         Result := attribute_value( "default_port" )
      end

end

