function searchBlogs(id, result){
	var XHR = new XMLHttpRequest();
	XHR.open("GET", "/blogs/search?substring="+id.value, true);

	XHR.onreadystatechange = function() {
		if(this.readyState != 4) return;
		if(this.status != 200) return;

		var response = this.responseText;
		var data = JSON.parse(response);

		result.innerHTML = "";

		var row = document.createElement('div');
        row.className = 'row';
        result.appendChild(row);

		var dataSize = data.length;
		for(var i = 0; i < dataSize; i++){
			var img = document.createElement('IMG');
            img.src = 'assets/' + data[i].image_id;
			img.className = 'center thumbnail sm';

			var link = document.createElement('A');
			link.href = '/blogs/' + data[i].id;
            link.className = 'col-md-2 col-sm-3 col-xs-6 blog-search-item list-group-item';

            var title = document.createElement('H5');
            title.className = 'text-center';
            var t = document.createTextNode(data[i].title);
            title.appendChild(t);

            title.appendChild(document.createElement('BR'));
            var author = document.createElement('SMALL');
            author.appendChild(document.createTextNode(data[i].author));
            title.appendChild(author);

			link.appendChild(img);
            link.appendChild(title);
			row.appendChild(link);
		}

	}
	XHR.send();
}