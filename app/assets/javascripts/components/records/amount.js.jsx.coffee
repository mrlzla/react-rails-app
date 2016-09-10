@RecordAmount = React.createClass
	getDefaultProps: ->
		type: ''
		amount: ''
		text: ''

	render: ->
		panelClass = "panel panel-#{@props.type}"
		`<div className='record_amount col-md-4'>
		 	<div className={panelClass}>
				<div className='panel-heading'>
					{this.props.text}
				</div>
				<div className='panel-body'>
					$ {this.props.amount}
				</div>
			</div>
		 </div>`