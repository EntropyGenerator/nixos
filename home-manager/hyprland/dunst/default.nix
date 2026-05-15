{
    pkgs,
    config,
    ...
}: {
    home.file.".config/dunst/dunstrc".source = ./dunstrc;
}