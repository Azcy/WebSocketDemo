<!DOCTYPE html>
<%@page contentType="text/html; charset=GBK" language="java"  %>
<html>
<head>
    <meta name="author" content="Yeeku.H.Lee(CrazyIt.org)" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title> ʹ��WebSocketͨ�� </title>
    <script type="text/javascript">
        // ����WebSocket����
        var webSocket = new WebSocket("ws://127.0.0.1:8080/chat");
        var sendMsg = function()
        {
            var inputElement = document.getElementById('msg');
            // ������Ϣ
            webSocket.send(inputElement.value);
            // ��յ����ı���
            inputElement.value = "";
        }
        var send = function(event)
        {
            if (event.keyCode == 13)
            {
                sendMsg();
            }
        };
        webSocket.onopen = function()
        {
            // Ϊonmessage�¼��󶨼�������������Ϣ
            webSocket.onmessage= function(event)
            {
                var show = document.getElementById('show')

                // ���ա�����ʾ��Ϣ
                show.innerHTML += event.data + "<br/>";
                show.scrollTop = show.scrollHeight;
            }
            document.getElementById('msg').onkeydown = send;
            document.getElementById('sendBn').onclick = sendMsg;
        };
        webSocket.onclose = function ()
        {
            document.getElementById('msg').onkeydown = null;
            document.getElementById('sendBn').onclick = null;
            Console.log('WebSocket�Ѿ����رա�');
        };
    </script>
</head>
<body>
<div style="width:600px;height:240px;
	overflow-y:auto;border:1px solid #333;" id="show"></div>
<input type="text" size="80" id="msg" name="msg" placeholder="������������"/>
<input type="button" value="����"  id="sendBn" name="sendBn" onclick="send()"/>

</body>
</html>
