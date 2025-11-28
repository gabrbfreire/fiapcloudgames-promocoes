using Microsoft.AspNetCore.Identity;

namespace FiapCloudGames.Promocoes.Core.Entities.Identity;

public class ApplicationUser : IdentityUser
{
    public string Name { get; set; } = string.Empty;
}
