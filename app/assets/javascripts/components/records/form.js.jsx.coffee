@RecordForm = React.createClass
	getInitialState: ->
		title: ''
		date: ''
		amount: ''

	valid: ->
		@state.title and @state.date and @state.amount

	handleChange: (e) ->
		name = e.target.name
		value = e.target.value
		@setState "#{name}" : value

	handleSubmit: (e)->
		e.preventDefault()
		@props.createItem(@state)
		@setState @getInitialState()

	render: ->
		`<form className='form-inline' onSubmit={this.handleSubmit}>
			<div className='form-group'>
				<input type='date' className='form-control' placeholder='Date' name='date' value={this.state.date} onChange={this.handleChange} />
			</div>
			<div className='form-group'>
				<input type='datetime' className='form-control' placeholder='Title' name='title' value={this.state.title} onChange={this.handleChange} />
			</div>
			<div className='form-group'>
				<input type='number' className='form-control' placeholder='Amount' name='amount' value={this.state.amount} onChange={this.handleChange} />
			</div>
			<button type='submit' className='btn btn-primary' disabled={!this.valid()}> Create record </button>
		</form>`
 