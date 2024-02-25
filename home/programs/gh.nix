{
  config,
  pkgs,
  ...
}: {
  programs.gh.enable = true;
  programs.gh.settings.git_protocol = "ssh";
  programs.gh.gitCredentialHelper.enable = true;
}
