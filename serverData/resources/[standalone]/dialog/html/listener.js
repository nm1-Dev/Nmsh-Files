let wrapperHtml = `
<div id="dialog-wrap">
	<span id="dialog-title">dialog-title</span><br/><br/>
	<span id="dialog-description">dialog-description</span><br/><br/>
	<span id="dialog-price-text">Price:</span> <span id="price">$price</span><br/><br/>
	<input type="text" class="dialog-input-design" id="dialog-input" value="1"><br/><br/>
	<button id="btn-important">submit</button>
	<button id="btn">cancel</button>
</div>`

$(function () {
	window.addEventListener('message', function (event) {
		if (event.data.action == 'show') {
			let title = event.data.title;
			let desc = event.data.desc;
			let pricetxt = event.data.pricetxt;
			let price = event.data.price;
			
			$('body').hide();
			$('#wrap').hide();
			
			$('#wrap').html(wrapperHtml);
			$('#dialog-title').html(title);
			$('#dialog-description').html(desc);
			$('#dialog-price-text').html(pricetxt);
			$('#price').html(price);
			
			if (event.data.decision) {
				$("#dialog-input").hide();
				$('#btn-important').html('yes');
				$('#btn').html('no');
			}
			
			if (event.data.submit) {
				$('#btn-important').html(event.data.submit);
			}
			
			if (event.data.cancel) {
				$('#btn').html(event.data.cancel);
			}
			
			$('body').fadeIn();
			$('#wrap').fadeIn();
		}
		else if (event.data.action == 'hide') {
			$('body').hide();
			$('#wrap').hide();
		}
		
		$('#btn-important').click(function () {
			$.post("https://dialog/submit", JSON.stringify({
				action: 'submit',
				value: $("#dialog-input").val()
			}));
		});

		$('#btn').click(function () {
			$.post("https://dialog/cancel", JSON.stringify({
				action: 'cancel'
			}));
		});
		
	}, false);
});