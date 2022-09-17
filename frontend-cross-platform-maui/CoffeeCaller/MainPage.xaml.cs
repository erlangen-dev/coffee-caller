namespace CoffeeCaller;

public partial class MainPage : ContentPage
{
	public MainPage()
	{
		InitializeComponent();
	}

	private void OnJoinClicked(object sender, EventArgs e)
	{
		SemanticScreenReader.Announce(JoinButton.Text);
	}
	private void OnLeaveClicked(object sender, EventArgs e)
	{
		SemanticScreenReader.Announce(JoinButton.Text);
	}
	private void OnStartClicked(object sender, EventArgs e)
	{
		SemanticScreenReader.Announce(JoinButton.Text);
	}
}

