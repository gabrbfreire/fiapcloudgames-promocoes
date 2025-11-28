using FiapCloudGames.Promocoes.Core.Entities;

namespace FiapCloudGames.Promocoes.Infra.Repositories;

public interface IPromocaoRepository
{
    Task<IEnumerable<Promocao>> BuscarTodasAsync();
    Task<Promocao?> BuscarPorIdAsync(Guid id);
    Task AdicionarAsync(Promocao promocao);
    Task AtualizarAsync(Promocao promocao);
    Task RemoverAsync(Promocao promocao);
    Task<IEnumerable<Promocao>> BuscarAtivasPorDataAsync(DateTime dataReferencia);
}