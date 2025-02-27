class_name GoogleRequestor extends Node

var http_request = HTTPRequest.new()

func request(googelsheet_public_url):
	http_request.request_completed.connect(_on_http_request_request_completed)
	http_request.request(googelsheet_public_url)
	pass


func _on_http_request_request_completed(result, response_code, headers, body):
	#var json = JSON.parse_string(body.get_string_from_utf8())
	print("Requesting...")
	#print(body.get_string_from_utf8())
	var data =  convert_html_table_to_json(body.get_string_from_utf8())
	return data


func convert_html_table_to_json(html_content: String):
	var table_data = []
	var row_regex = RegEx.new()
	row_regex.compile(r"<tr.*?>(.*?)</tr>")
	
	var cell_regex = RegEx.new()
	cell_regex.compile(r"<td.*?>(.*?)</td>")
	
	for row_match in row_regex.search_all(html_content):
		var row_content = row_match.get_string(1)
		var row_values = []
		
		for cell_match in cell_regex.search_all(row_content):
			row_values.append(cell_match.get_string(1).strip_edges())
		
		if row_values.size() > 0:
			table_data.append(row_values)
			
	table_data.resize(table_data.size() - 2) # remove 2 last table row of other table
	
	# remove all duplicate keys null keys, then resize all rows content, 
	var keys_list = table_data.pop_front()
	var values_list = []
	
	keys_list = get_uniques(keys_list)
	
	var content_max_size = keys_list.size()
	
	for row in table_data:
		row.resize(content_max_size)
		row = get_uniques(row)
		if row.size() == 1:
			continue
		else:
			values_list.append(row)
		
	
	
	
	#print(keys_list)
	#print(values_list)
	
	var table_content = []
	
	var regex = RegEx.new()
	regex.compile("<[^>]*>") # remove all tags left in cell's content
	
	for row in values_list:
		
		var _data_row = {}
		
		for i in range(keys_list.size()):
			if keys_list[i] == "":
				continue
			
			row[i] = regex.sub(row[i], "", true)
			_data_row[keys_list[i]] = decode_html_entities(row[i])
		
		#print(_data_row)
		
		table_content.append(_data_row)
	

	
	return table_content
	
func get_uniques(array: Array) -> Array:
	var unique: Array = []
	
	for item in array:
		if not unique.has(item):
			unique.append(item)

	return unique
	
func decode_html_entities(text: String) -> String:
	var parser = XMLParser.new()
	var wrapped_text = "<root>" + text + "</root>"
	var byte_array = wrapped_text.to_utf8_buffer()
	
	if parser.open_buffer(byte_array) != OK:
		return text  # Return original text if parsing fails

	while parser.read() == OK:  # Keep reading until we reach a text node
		if parser.get_node_type() == XMLParser.NODE_TEXT:
			return parser.get_node_data()  # Return decoded text
	
	return text  # If no text node is found, return original text
