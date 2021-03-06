import { nextInstance } from '../store/action-creators';

<instancecontrols>
	<ol class="breadcrumb">
		<li><i class="fa fa-server"></i> instances</li>
		<li>{ instance.name }</li>
	</ol>

	<div class="alert alert-block alert-warning" show={ instance.status.invalid }>
		<i class="fa fa-exclamation-triangle"></i> Sorry, <strong>{ instance.name }</strong> is no longer a valid instance. 
			<span show={ hasValid }>Select the <a onclick={ nextInstance } role="button">next available</a>.</span>
			<span show={ !hasValid }>There are no other valid instances at this time.</span>
	</div>

	<div hide={ instance.status.invalid }>
		<h4><i class="fa fa-braille"></i> Memory</h4>
		<hr />
		<memorycontrol usage={ instance.memoryUsage }></memorycontrol>
	</div>

	<div class="clearfix"></div>

	<div hide={ instance.status.invalid }>
		<h4><i class="fa fa-hdd-o"></i> Disk</h4>
		<hr />
		<diskcontrol usage={ instance.diskUsage }></diskcontrol>
	</div>

	<script>
		this.mixin('redux');
		this.dispatchify({ nextInstance });

		this.subscribe(state => {
			let selected = state.selected;
			return { 
				instance: selected, 
				hasValid: (!selected || selected.status.invalid && state.instances.length > 1)
			};
		})
	</script>
</instancecontrols>