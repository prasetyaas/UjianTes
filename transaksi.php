<?php include "head.php" ?>
<?php
	if (isset($_GET['action']) && $_GET['action']=="transaksi_baru") {
		include "transaksi_baru.php";
	}
	else if (isset($_GET['action']) && $_GET['action']=="detail_transaksi") {
		include "detail_transaksi.php";
	}

	else{
?>

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
write_log("Sukses Memasuki Menu Transaksi");
}else{
write_log("Gagal Memasuki Menu Transaksi");
}

?>

<script type="text/javascript">
	document.title="Transaksi";
	document.getElementById('transaksi').classList.add('active');
</script>
<div class="content">
	<div class="padding">
		<div class="bgwhite">
			<div class="padding">
			<div class="contenttop">
				<div class="left">
					<a href="?action=transaksi_baru" class="btnblue">Transaksi Baru</a>
				</div>
				<div class="both"></div>
			</div>
			<span class="label">Jumlah Transaksi : <?= $root->show_jumlah_trans() ?></span>
			<table class="datatable">
				<thead>
				<tr>
					<th width="35px">NO</th>
					<th>Tanggal Transaksi</th>
					<th>Total Bayar</th>
					<th>Nomor Meja</th>
					<th>No Invoice</th>
				</tr>
			</thead>
			<tbody>
				<?php
				$no=1;
				$q=$root->con->query("select * from transaksi order by id_transaksi desc");
				if ($q->num_rows > 0) {
				while ($f=$q->fetch_assoc()) {
					?>
					<tr>
						<td><?= $no++ ?></td>
						<td><?= date("d-m-Y",strtotime($f['tgl_transaksi'])) ?></td>
						<td>Rp. <?= number_format($f['total_bayar']) ?></td>
						<td><?= $f['nomor_meja'] ?></td>
						<td><?= $f['no_invoice'] ?></td>
					</tr>
					<?php
				}
			}else{
				?>
				<td><?= $no++ ?></td>
				<td colspan="5">Belum Ada Transaksi</td>
				<?php
			}
				?>
			</tbody>
			</table>
			</div>
		</div>
	</div>
</div>

<?php 
}
include "foot.php" ?>
