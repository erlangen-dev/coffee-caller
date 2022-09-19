namespace CoffeeCaller;

public partial class MainPage : ContentPage
{
	private const string Name = "Dodd Nedd";

	private readonly SocketClient client;

	public MainPage()
	{
		InitializeComponent();

		client = new SocketClient();
		client.Connect();
	}

	private void OnJoinClicked(object sender, EventArgs e)
	{
		client.Join(Name);
		SemanticScreenReader.Announce(JoinButton.Text);
	}
	private void OnLeaveClicked(object sender, EventArgs e)
	{
		client.Leave(Name);
		SemanticScreenReader.Announce(JoinButton.Text);
	}
	private void OnStartClicked(object sender, EventArgs e)
	{
		client.Start(Name);
		SemanticScreenReader.Announce(JoinButton.Text);
	}
}

