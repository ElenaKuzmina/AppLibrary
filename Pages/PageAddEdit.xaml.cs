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
    /// Логика взаимодействия для PageAddEdit.xaml
    /// </summary>
    public partial class PageAddEdit : Page
    {
        Books _currentBook  = new Books(); 
        public PageAddEdit(Books booklocal)
        {
            InitializeComponent();
            CmbPublic.ItemsSource = LibraryEntities.GetContext().Publishing.ToList();
            CmbPublic.SelectedValuePath = "id_publishing";
            CmbPublic.DisplayMemberPath = "NamePub";

            CmbAuthor.ItemsSource = LibraryEntities.GetContext().Author.ToList();
            CmbAuthor.SelectedValuePath = "id_author";
            CmbAuthor.DisplayMemberPath = "Surname";

            CmbGenre.ItemsSource = LibraryEntities.GetContext().Genre.ToList();
            CmbGenre.SelectedValuePath = "id_Genre";
            CmbGenre.DisplayMemberPath = "NameGe";

            CmbCategory.ItemsSource = LibraryEntities.GetContext().Categories.ToList();
            CmbCategory.SelectedValuePath = "id_Categories";
            CmbCategory.DisplayMemberPath = "NameCat";

            CmbFormat.ItemsSource = LibraryEntities.GetContext().Format.ToList();
            CmbFormat.SelectedValuePath = "id_Format";
            CmbFormat.DisplayMemberPath = "NameFor";

            if (booklocal != null)
                _currentBook = booklocal;
            //создаем контекст
            DataContext = _currentBook;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (_currentBook.id_book == 0)

                LibraryEntities.GetContext().Books.Add(_currentBook);
            
            LibraryEntities.GetContext().SaveChanges();

            MessageBoxResult boxResult = MessageBox.Show("Данные добавлены. Добавить еще?",
                "Сообщение", MessageBoxButton.YesNo);
            if (boxResult == MessageBoxResult.Yes)
            {
                TxtNameBook.Clear();
                TxtCountBook.Clear();
                //TxtYearBook.Clear();
                TxtNameBook.Focus();
            }
            else
                Classes.ClassFrame.frmObj.Navigate(new Pages.PageBooks());
        }
    }
}
