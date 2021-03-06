using Furkan.Furkan_BlogProject.Entities.Concreate;
using Furkan.Furkan_BlogProject.Entities.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Furkan.Furkan_BlogProject.DataAccess.Interface
{
    public interface IBlogDAL : IGenericDAL<Blog>
    {
        Task<List<Blog>> GetAllWithCategoryIdAsync(int categoryId);
    }
}
