<%@ Page Language="C#" %>
<!DOCTYPE html>
<html>
<head>
<title>Managed by Puppet</title>
</head>
<body>
<h1>Managed by Puppet</h1>

<strong>Time:</strong> <%= DateTime.UtcNow.ToString("s") + "Z" %>
</body>
</html>
