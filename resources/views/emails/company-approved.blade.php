<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Company Approved</title>
</head>
<style>
    table {
        border-collapse: collapse !important;
    }

    body {
        height: 100% !important;
        margin: 0 !important;
        padding: 0 !important;
        width: 100% !important;
        background: linear-gradient(135deg, #F8FAFC 0%, #E2E8F0 100%);
    }

    .header-section {
        background: #94B02F;
        padding: 20px 30px;
        text-align: center;
        position: relative;
    }

    .email-container {
        max-width: 600px;
        margin: 0 auto;
        background: #ffffff;
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
    }

    .btn {
        font-size: 18px;
        padding: 15px 36px;
        border-radius: 60px;
        border: none;
        transition: all 0.4s ease;
        background-color: #fc7100;
        color: #fff;
        text-decoration: none;
    }

    .content-section {
        padding: 40px 30px;
        background: #ffffff;
    }

    .footer-section {
        background: #F8FAFC;
        padding: 30px;
        text-align: center;
        border-top: 1px solid #E5E7EB;
    }

    .footer-text {
        font-family: 'Inter', sans-serif;
        font-size: 14px;
        color: #6B7280;
        margin: 0;
    }
    h1,h2, p {
        margin: 30px 0;
    }
</style>

<body>
    <div class="mail-wrapper">
        <table border="0" cellpadding="0" cellspacing="0" width="100%"
            style="background: linear-gradient(135deg, #F8FAFC 0%, #E2E8F0 100%);">
            <tr>
                <td align="center" style="padding: 20px 0;">
                    <div class="email-container">
                        <div class="header-section">
                            <h1 class="welcome-title" style="color: #fff">Welcome to League of Contractors</h1>
                            <p class="welcome-subtitle" style="color: #fff">Profile Approval</p>
                        </div>
                        <div class="content-section">
                            <h2>Hi <span>{{ $company->user->name }}</span></h2>


                            <p>Your Profile has been Approved Successfully</p>
                            <p>
                                <a class="btn" href="{{ url('/login') }}">
                                    Access Your Account
                                </a>
                            </p>
                        </div>
                        <div class="footer-section">
                            <p class="footer-text">
                                <strong>League of Contractors</strong>
                            </p>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</body>

</html>
