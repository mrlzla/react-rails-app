@RecordBox = React.createClass
	getInitialState: ->
		records: @props.data

	getDefaultProps: ->
		records: []

	createItem: (record) ->
		records = @state.records
		record.id = null
		newRecords = React.addons.update(@state.records, { $push: [record] })
		@setState records: newRecords 

		$.ajax
			dataType: 'json'
			type: 'POST'
			data: record: record
			success: (record) =>
				newRecords = React.addons.update(records, { $push: [record] })
				@setState records: newRecords
			error: (xhr, status, err) =>
				@setState(records: records)

	updateItem: (record, data) ->
		old_records = @state.records
		index = @state.records.indexOf record
		records = React.addons.update(@state.records, { $splice: [[index, 1, data]] })
		@setState records: records

		$.ajax
			method: 'PUT'
			url: "records/#{record.id}"
			dataType: 'JSON'
			data: record: data
			error: (xhr, status, err) =>
				@setState(records: old_records)

	deleteItem: (record) ->
		old_records = @state.records
		index = @state.records.indexOf record
		records = React.addons.update(@state.records, { $splice: [[index, 1]] })
		@setState records: records

		$.ajax
			method: 'DELETE'
			url: "records/#{record.id}"
			dataType: 'JSON'
			success: () =>
				@setState records: records
			error: (xhr, status, err) =>
				@setState(records: old_records)

	render: ->
		`<div className='record_box'>
				<h2 className="record_box_title">Records</h2>
				<RecordAmounts records={this.state.records} />
				<RecordForm createItem={this.createItem} />
				<hr />
				<RecordList records={this.state.records} updateItem={this.updateItem} deleteItem={this.deleteItem} />
		 </div>`