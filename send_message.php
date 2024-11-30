<?php
// Mulai sesi
session_start();
require "functions.php";

// Sertakan file PHPMailer
require 'PHPMailer/PHPMailer.php';
require 'PHPMailer/SMTP.php';
require 'PHPMailer/Exception.php';

// Gunakan PHPMailer namespace
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

// Cek apakah pengguna sudah login
$is_logged_in = isset($_SESSION["id_user"]) && !empty($_SESSION["id_user"]);

if (!$is_logged_in) {
    echo "<script>alert('Anda harus login terlebih dahulu.'); window.location.href='login.php';</script>";
    exit; // Hentikan eksekusi jika pengguna belum login
}

$id_user = $_SESSION["id_user"];

// Jalankan query untuk mendapatkan data profil pengguna
$profil = query("SELECT * FROM user_212279 WHERE 212279_id_user = '$id_user'");

// Periksa apakah query menghasilkan hasil
if (count($profil) > 0) {
    $profil = $profil[0];
} else {
    // Jika tidak ditemukan data pengguna, set profil ke null dan lanjutkan
    $profil = null;
}

// Tangani form submission jika ada
if (isset($_POST["name"]) && isset($_POST["message"])) {
    $name = htmlspecialchars($_POST["name"]);
    $message = htmlspecialchars($_POST["message"]);

    // Ambil email pengguna dari sesi
    $user_email = isset($profil["212279_email"]) ? $profil["212279_email"] : "no-reply@example.com";

    // Inisialisasi PHPMailer
    $mail = new PHPMailer(true);

    try {
        // Konfigurasi server SMTP
        $mail->isSMTP();                                            // Gunakan SMTP
        $mail->Host       = 'smtp.gmail.com';                       // Ganti dengan server SMTP Anda
        $mail->SMTPAuth   = true;                                   // Aktifkan otentikasi SMTP
        $mail->Username   = 'erzhasatria@gmail.com';                 // Ganti dengan alamat email Anda
        $mail->Password   = 'dcmrwtvglmihicjz';                        // Ganti dengan password email Anda
        $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;           // Aktifkan enkripsi TLS
        $mail->Port       = 587;                                    // Port untuk TLS

        // Pengaturan penerima
        $mail->setFrom($user_email, $name); // Ganti 'Your Name' dengan nama pengirim
        $mail->addAddress('erzhasatria@gmail.com'); // Ganti dengan email admin

        // Konten email
        $mail->isHTML(false); // Set format email ke teks biasa
        $mail->Subject = "Pesan dari $name";
        $mail->Body    = "Nama: $name\nPesan: $message";

        // Kirim email
        $mail->send();
        echo "<script>alert('Pesan berhasil dikirim'); window.location.href='index.php';</script>";
    } catch (Exception $e) {
        echo "<script>alert('Pesan gagal dikirim. Error: {$mail->ErrorInfo}'); window.location.href='index.php';</script>";
    }
}
