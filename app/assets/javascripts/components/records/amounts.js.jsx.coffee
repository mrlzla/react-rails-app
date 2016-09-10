@RecordAmounts = React.createClass
	getDefaultProps: ->
		records: []

	credits: ->	
		credits = @props.records.filter (val) -> val.amount >= 0
		credits.reduce ((prev, curr) ->
			prev + parseFloat(curr.amount)
		), 0

	debits: ->
		debits = @props.records.filter (val) -> val.amount < 0
		debits.reduce ((prev, curr) ->
			prev + parseFloat(curr.amount)
		), 0

	balance: () ->
		@credits() + @debits()

	render: () ->
		`<div className='record_amounts row' >
			<RecordAmount text='Credits' amount={this.credits()} type='success' />
			<RecordAmount text='Debits' amount={this.debits()} type='danger' />
			<RecordAmount text='Balance' amount={this.balance()} type='info' />
		 </div>`