fn main() {
    //slint_build::compile("src/ui/Settings.slint").unwrap();
    slint_build::compile("src/ui/MainWindow.slint").unwrap();
    slint_build::print_rustc_flags().unwrap();
}