using AppLibrary.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace AppLibrary.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageBooks.xaml
    /// </summary>
    public partial class PageBooks : Page
    {
        public PageBooks()
        {
            InitializeComponent();
         
            dtgBooks.ItemsSource = LibraryEntities.GetContext().Books.ToList();

            CmbYear.ItemsSource = LibraryEntities.GetContext().Books.Select(x => x.Year).Distinct().ToList();
            
            CmbGenre.ItemsSource = LibraryEntities.GetContext().Genre.ToList();
            CmbGenre.SelectedValue = "id_Genre";
            CmbGenre.DisplayMemberPath = "NameGe";

        }

        private void CmbYear_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //фильтр книг по году издания
            int year = (int)(CmbYear.SelectedValue);
            dtgBooks.ItemsSource = LibraryEntities.GetContext().Books.Where(x=>x.Year == year).ToList();

        }

        private void BtnResetFiltr_Click(object sender, RoutedEventArgs e)
        {
            //отмена всех фильтров

            dtgBooks.ItemsSource = LibraryEntities.GetContext().Books.ToList();

        }

        private void CmbGenre_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //фильтр книг по жанру
            int genre = CmbGenre.SelectedIndex + 1;
            dtgBooks.ItemsSource = LibraryEntities.GetContext().Books.
                Where(x => x.id_Genre == genre).ToList();

        }

        private void TxtSearchName_TextChanged(object sender, TextChangedEventArgs e)
        {
            // поиск по названию книги
            string search = TxtSearchName.Text;
            dtgBooks.ItemsSource = LibraryEntities.GetContext().Books.
                Where(x=>x.Name.Contains(search)).ToList();
        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Classes.ClassFrame.frmObj.Navigate(new Pages.PageAddEdit());
        }
    }
}
