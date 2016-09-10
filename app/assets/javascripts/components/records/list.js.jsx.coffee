@RecordList = React.createClass
	getDefaultProps: ->
		records: []
	render: ->
		nodes = for record in @props.records
			`<Record updateItem ={this.props.updateItem} deleteItem={this.props.deleteItem} key={record.id} record={record} />`
		`<table className='record_list table table-bordered'>
			<thead>
				<tr>
					<th> Date </th>
					<th> Title </th>
					<th> Amount </th>
					<th> Actions </th>
				</tr>
			</thead>
			<tbody>
				{nodes}
			</tbody>
		</table>`
