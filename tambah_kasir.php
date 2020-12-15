<?php
define('LOG','log.txt');
function write_log($log){  
 $time = @date('[Y-d-m:H:i:s]');
 $op=$time.' '.'Action for '.$log."\n".PHP_EOL;
 $fp = @fopen(LOG, 'a');
 $write = @fwrite($fp, $op);
 @fclose($fp);
}
if('submit'){
write_log("Sukses Menambah Kasirr");
}else{
write_log("Gagal Menambah Kasir");
}

?>

<script type="text/javascript">
	document.title="Tambah Kasir";
	document.getElementById('users').classList.add('active');
</script>

<div class="content">
	<div class="padding">
		<div class="bgwhite">
			<div class="padding">
				<h3 class="jdl">Tambah Kasir</h3>
				<form class="form-input" method="post" action="handler.php?action=tambah_kasir">
					<input type="text" name="nama_kasir" placeholder="Username Kasir" required="required">
					<input autocomplete="off" type="text" name="password" placeholder="Password" required="required">
					<button class="btnblue" type="submit"><i class="fa fa-save"></i> Simpan</button>
					<a href="users.php" class="btnblue" style="background: #f33155"><i class="fa fa-close"></i> Batal</a>
				</form>
			</div>
		</div>
	</div>
</div>
