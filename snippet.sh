var landeskDecryptCmd = 'vcac-config prop-util -d --p ' + lanDeskEncryptedPwd
var landeskPwd = System.getModule("com.xx.utility").getDecryptedPropertyValue(cafeHostNameOrIP,cafeUserName,"22",cafePassword,"",true,landeskDecryptCmd,"");
 
function getDecryptedPropertyValue(cafeHostNameOrIP,cafeUserName,"22",cafePassword,"",true,landeskDecryptCmd,"")
{
var session = null;
try {
            if (port) {
                        session = new SSHSession(hostName, username, port);
            } else {
                        System.log("A port value is not provided! Using default port 22");
                        session = new SSHSession(hostName, username);
            }
 
            if (passwordAuthentication){
                        System.log("Connecting with password");
            } else {
                        if (path == null || path == ""){
                                    System.log("using default");
                                    path = defaultKeyPairPath;
                        }
                        System.log("Connecting with key pair (" + path + ")");
                        password = passphrase;
            }
 
            session.connectWithPasswordOrIdentity(passwordAuthentication, password, path);
            System.log("Connected!");
 
            session.setEncoding(encoding);
            session.executeCommand(cmd, true);
 
            output = session.getOutput();
            error = session.getError();
            exitCode = session.exitCode;
 
            //System.log("Output: '" + output + "'");
            System.log("Error: '" + error + "'");
            System.log("Exit code: '" + exitCode + "'");
 
} catch (e) {
            throw "Unable to execute command: " + e;
} finally {
            if (session) {
                        session.disconnect();
            }
}
 
return output;
}