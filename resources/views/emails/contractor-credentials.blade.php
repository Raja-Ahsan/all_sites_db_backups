<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contractor Credentials</title>
</head>
<body>

<h2>Welcome to League of Contractors</h2>

<p>Hi {{ $user->name }},</p>

<p>Your contractor account is created successfully. You can now log in using the details below:</p>

<p><strong>Email:</strong> {{ $user->email }}</p>
<p><strong>Password:</strong> {{ $password }}</p>

<p>Please login and change your password immediately.</p>

<p>
    <a href="{{ url('/login') }}" 
       style="background:#000;color:#fff;padding:10px 20px;text-decoration:none;border-radius:5px;">
        Login Now
    </a>
</p>

<p>Thank you,<br>League of Contractors Team</p>

</body>
</html>
