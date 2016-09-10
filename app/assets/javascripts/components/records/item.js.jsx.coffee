@Record = React.createClass
	getInitialState: ->
		edit: false

	handleDelete: (e)->
		e.preventDefault()
		@props.deleteItem(@props.record)

	handleUpdate: (e) ->
		e.preventDefault()
		data =
			title: @refs.title.value
			date: @refs.date.value
			amount: @refs.amount.value
			id: @props.record.id
		@props.updateItem(@props.record, data)
		@setState edit: !@state.edit

	handleToggle: (e) ->
		e.preventDefault()
		@setState edit: !@state.edit

	recordRow: ->
		`<tr>
			<td> {this.props.record.date} </td>
			<td> {this.props.record.title} </td>
			<td> $ {this.props.record.amount} </td>
			<td>
				<a className='btn btn-default' onClick={this.handleToggle}>Edit</a>
				<a className='btn btn-danger' onClick={this.handleDelete}>Delete</a>
			</td>
		</tr>`

	recordForm: ->
		`<tr>
			<td><input className='form-control' type='date' defaultValue={this.props.record.date} ref='date' /></td>
			<td><input className='form-control' type='text' defaultValue={this.props.record.title} ref='title' /></td>
			<td><input className='form-control' type='number' defaultValue={this.props.record.amount} ref='amount' /></td>
			<td>
				<a className='btn btn-default' onClick={this.handleUpdate}>Update</a>
				<a className='btn btn-danger' onClick={this.handleToggle}>Cancel</a>
			</td>
		</tr>`

	render: ->
		if @state.edit
			@recordForm()
		else
			@recordRow()
		
