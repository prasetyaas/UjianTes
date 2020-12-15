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
write_log("Sukses Memasuki Detail Transaksi");
}else{
write_log("Gagal Memasuki Detail Transaksi");
}

?>

<script type="text/javascript">
	<?php
	if ($_SESSION['status']==1) {
		?>
	document.title="Detail laporan";
	document.getElementById('laporan').classList.add('active');
		<?php
	}else{
	?>
	document.title="Detail transaksi";
	document.getElementById('transaksi').classList.add('active');
	<?php } ?>
</script>

<div class="content">
	<div class="padding">
		<div class="bgwhite">
			<div class="padding">
				<?php
				if ($_SESSION['status']==1) {
				?>
				<h3 class="jdl">Detail Laporan</h3>
				<?php }else{ ?>
				<h3 class="jdl">Detail Transaksi</h3>
				<?php } ?>
				<?php
				$getqheader=$root->con->query("select * from transaksi where id_transaksi='$_GET[id_transaksi]'");
				$getqheader=$getqheader->fetch_assoc();
				?>
				<table>
					<tr>
						<td><span class="label">Nomor Meja</span></td><td><span class="label">:</span></td>
						<td><span class="label"><?= $getqheader['nomor_meja'] ?></span></td>
					</tr>
					<tr>
						<td><span class="label">Tanggal Transaksi</span></td><td><span class="label">:</span></td>
						<td><span class="label"><?= date("d-m-Y",strtotime($getqheader['tgl_transaksi'])) ?></span></td>
					</tr>
					<tr>
						<td><span class="label">No Invoice</span></td><td><span class="label">:</span></td>
						<td><span class="label"><?= $getqheader['no_invoice'] ?></span></td>
					</tr>
				</table>
				<table class="datatable" style="width: 100%;">
					<thead>
				<tr>
					<th width="35px">NO</th>
					<th>Nama Barang</th>
					<th>Jumlah Beli</th>
					<th>Harga</th>
					<th>Total Harga</th>
				</tr>
			</thead>
					<tbody>
				<?php
				$trx=date("d")."/AF/".$_SESSION['status']."/".date("y");
				$data=$root->con->query("select barang.nama_barang,barang.harga_jual,sub_transaksi.jumlah_beli,sub_transaksi.total_harga from sub_transaksi inner join barang on barang.id_barang=sub_transaksi.id_barang where sub_transaksi.id_transaksi='$_GET[id_transaksi]'");
				$getsum=$root->con->query("select sum(total_harga) as grand_total,sum(jumlah_beli) as jumlah_beli from sub_transaksi where id_transaksi='$_GET[id_transaksi]'");
				$getsum1=$getsum->fetch_assoc();
				$no=1;
				while ($f=$data->fetch_assoc()) {
					?><tr>
						<td><?= $no++ ?></td>
						<td><?= $f['nama_barang'] ?></td>
						<td><?= $f['jumlah_beli'] ?></td>
						<td>Rp. <?= number_format($f['harga_jual']) ?></td>
						<td>Rp. <?= number_format($f['total_harga']) ?></td>
						</tr>
					<?php
				}
				?>
				<tr>
					<td></td><td></td><td></td><td>Grand Total :</td><td> Rp. <?= number_format($getsum1['grand_total']) ?></td>
				</tr>
			</tbody>
				</table>
				<br>
				<div class="left">
					<?php
						$link=($_SESSION['status']==1) ? "laporan.php" : "transaksi.php";
					?>
					<a href="<?= $link ?>" class="btnblue" style="background: #f33155"><i class="fa fa-mail-reply"></i> Kembali</a>
					<?php if ($_SESSION['status']==2) {
					 ?>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</div>
