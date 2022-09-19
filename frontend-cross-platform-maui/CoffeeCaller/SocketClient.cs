using SocketIOClient;

namespace CoffeeCaller;

internal class SocketClient
{
	private const string Event = "coffee";

	private readonly SocketIO client;

	public SocketClient()
	{
		client = new SocketIO("http://localhost:4200");
	}

	public async void Connect()
	{

		client.On(Event, response =>
		{
			var message = response.GetValue<Message>();
		});

		await client.ConnectAsync();
	}

	public void Join(string name)
	{
		client.EmitAsync(Event, new Message(name, MessageType.Join));
	}
	public void Leave(string name)
	{
		client.EmitAsync(Event, new Message(name, MessageType.Leave));
	}
	public void Start(string name)
	{
		client.EmitAsync(Event, new Message(name, MessageType.Start));
	}
}

#pragma warning disable IDE1006 // Naming Styles
internal record struct Message(String name, String type);
#pragma warning restore IDE1006 // Naming Styles

internal class MessageType
{
	private readonly string value;

	private MessageType(string type) { value = type; }

	public static implicit operator String(MessageType type) { return type.value; }

	public static MessageType Join => new("join");
	public static MessageType Leave => new("leave");
	public static MessageType Start => new("start");
}

