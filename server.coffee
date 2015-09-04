beforeCreateUser = (options, user) ->
	if user.services.ufsc?
		roomName = user.services.ufsc.state.toLowerCase()

		user.defaultRoom = 'channel/' + roomName


beforeJoinDefaultChannels = (user) ->
	if user.services.ufsc?
		roomName = user.services.ufsc.state.toLowerCase()

		room = ChatRoom.findOne {name: roomName, t: 'c'}, {fields: {_id: 1}}

		if not room?
			throw new Meteor.Error "UFSC method beforeCreateUser -> Room with name [#{roomName}] does not exists"

		Meteor.runAsUser user._id, ->
			Meteor.call 'joinRoom', room._id


RocketChat.callbacks.add 'beforeCreateUser', beforeCreateUser, RocketChat.callbacks.priority.HIGH

RocketChat.callbacks.add 'beforeJoinDefaultChannels', beforeJoinDefaultChannels, RocketChat.callbacks.priority.HIGH
