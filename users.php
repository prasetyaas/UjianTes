<?php include "head.php" ?>
<?php
	if (isset($_GET['action']) && $_GET['action']=="tambah_kasir") {
		include "tambah_kasir.php";
	}
	else if (isset($_GET['action']) && $_GET['action']=="edit_kasir") {
		include "edit_kasir.php";
	} else

		if (isset($_GET['action']) && $_GET['action']=="tambah_pelayan") {
		include "tambah_pelayan.php";
	}
	else if (isset($_GET['action']) && $_GET['action']=="edit_pelayan") {
		include "edit_pelayan.php";
	} else {
?>



<script type="text/javascript">
	document.title="Data Staff";
	document.getElementById('users').classList.add('active');
</script>

<div class="content">
	<div class="padding">
		<div class="bgwhite">
			<div class="padding">
			<div class="contenttop">
				<div class="left">
				<a href="?action=tambah_kasir" class="btnblue">Tambah Kasir</a>
				<a href="?action=tambah_pelayan" class="btnblue">Tambah Pelayan</a>
				</div>
				<div class="both"></div>
			</div>
			<table class="datatable" id="datatable" style="width: 600px;">
				<thead>
				<tr>
					<th width="10px">#</th>
					<th>Username</th>
					<th>Tanggal Didaftarkan</th>
					<th width="60px">Aksi</th>
				</tr>
			</thead>
			<tbody>
					<?php
					$root->tampil_kasir();
					?>
			</tbody>

			</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function myconfirm(){
		confirm("Yakin Ingin Menghapus ?");
		return false;
	}
</script>

<?php 
}
include "foot.php" ?>