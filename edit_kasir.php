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
write_log("Sukses Edit Kasir");
}else{
write_log("Gagal Edit Kasir");
}

?>

<script type="text/javascript">
	document.title="Edit Kasir";
	document.getElementById('users').classList.add('active');
</script>

<div class="content">
	<div class="padding">
		<div class="bgwhite">
			<div class="padding">
				<h3 class="jdl">Edit Kasir</h3>
				<form class="form-input" method="post" action="handler.php?action=edit_kasir">
					<?php $f=$root->edit_kasir($_GET['id_kasir']) ?>
					<input type="hidden" name="id" value="<?= $f['id'] ?>">
					<input type="text" name="nama_kasir" placeholder="Username Kasir" required="required" value="<?= $f['username'] ?>">
					<input autocomplete="off" type="text" name="password" placeholder="Password">
					<label>* Password tidak bisa ditampikan karena terenkripsi</label><br>
					<label>* Kosongkan form password jika tidak ingin merubah password</label><br><br>
					<button class="btnblue" type="submit"><i class="fa fa-save"></i> Simpan</button>
					<a href="users.php" class="btnblue" style="background: #f33155"><i class="fa fa-close"></i> Batal</a>
				</form>
			</div>
		</div>
	</div>
</div>
