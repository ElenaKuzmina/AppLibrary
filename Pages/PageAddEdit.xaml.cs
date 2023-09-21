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
        public PageAddEdit()
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
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
                     
             Books book = new Books
            { Name = TxtNameBook.Text,
              Kolvo = int.Parse(TxtCountBook.Text),
              Year = int.Parse(TxtYearBook.Text),
              id_publishing = int.Parse(CmbPublic.SelectedValue.ToString()),
              id_author = int.Parse (CmbAuthor.SelectedValue.ToString()),
              id_Categories = int.Parse(CmbCategory.SelectedValue.ToString()),
              id_Genre = int.Parse(CmbGenre.SelectedValue.ToString()),
              id_Format = int.Parse(CmbFormat.SelectedValue.ToString())
            }
            ;
            LibraryEntities.GetContext().Books.Add(book);
            LibraryEntities.GetContext().SaveChanges();

            MessageBoxResult boxResult = MessageBox.Show("Данные добавлены. Добавить еще?",
                "Сообщение", MessageBoxButton.YesNo);
            if (boxResult == MessageBoxResult.Yes)
            {
                TxtNameBook.Clear();
                TxtCountBook.Clear();
                TxtYearBook.Clear();
                TxtNameBook.Focus();
            }
            else
                Classes.ClassFrame.frmObj.Navigate(new Pages.PageBooks());
        }
    }
}
