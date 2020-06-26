//
//  MoviesGridViewController.m
//  MyFlix
//
//  Created by Alyssa Tan on 6/25/20.
//  Copyright © 2020 Alyssa Tan. All rights reserved.
//

#import "MoviesGridViewController.h"
#import "MovieCollectionCell.h"
#import "UIImageView+AFNetworking.h"
#import "DetailsViewController.h"

@interface MoviesGridViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) NSArray *movies;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
//@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
//@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;

//@property (strong, nonatomic) NSArray *filteredData;

@end

@implementation MoviesGridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    //self.searchBar.delegate = self;
    //[self.activityIndicator startAnimating];
    [self fetchMovies];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout;
    
    layout.minimumLineSpacing = 3;
    layout.minimumInteritemSpacing = 5;
    
    CGFloat postersPerLine = 2;
    CGFloat itemWidth = (self.collectionView.frame.size.width - layout.minimumInteritemSpacing * (postersPerLine - 1))/postersPerLine;
    CGFloat itemHeight = itemWidth * 1.5;
    layout.itemSize = CGSizeMake(itemWidth,itemHeight);
}

- (void) fetchMovies{
    //NSLog(@"fetch called");
    NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/popular?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
              
               UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Cannot Get Movies"
                      message:@"The Internet Connection Appears to be offline"
               preferredStyle:(UIAlertControllerStyleAlert)];

               UIAlertAction *tryAgainAction = [UIAlertAction actionWithTitle:@"Try Again"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                                        //[self.activityIndicator startAnimating];
                                                                        [self fetchMovies];

                                                                 }];
               // add the try again action to the alertController
               [alert addAction:tryAgainAction];

               [self presentViewController:alert animated:YES completion:^{
                   // optional code for what happens after the alert controller has finished presenting
               }];

               
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
       
               // TODO: Get the array of movies
               self.movies = dataDictionary[@"results"];
               //self.filteredData = self.movies;
               
               // TODO: Store the movies in a property to use elsewhere
               // TODO: Reload your table view data
               [self.collectionView reloadData];
           }
        //NSLog(@"complete");
        //[self.activityIndicator stopAnimating];
       }];
    
    [task resume];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UITableViewCell *tappedCell = sender;
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:(UICollectionViewCell *)tappedCell];
    NSDictionary *movie = self.movies[indexPath.row];
    DetailsViewController *detailsViewController = [segue destinationViewController];
    detailsViewController.movie = movie;
    
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NSDictionary *movie = self.movies[indexPath.item];
    
    MovieCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MovieCollectionCell" forIndexPath:indexPath];
    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    
    NSURL*posterURL = [NSURL URLWithString:fullPosterURLString];
    
    cell.posterView.image = nil;
    cell.posterView.alpha = 0.0;
    [cell.posterView setImageWithURL:posterURL];
    
    //Animate UIImageView back to alpha 1 over 0.3sec
    [UIView animateWithDuration:1.0 animations:^{
        cell.posterView.alpha = 1.0;
    }];
    
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.movies.count;
}

/*
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {

    if (searchText.length != 0) {
        self.filteredData = [self.movies filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(title contains[c] %@)", searchText]];
//        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSString *evaluatedObject, NSDictionary *bindings) {
//            return [evaluatedObject containsString:searchText];
//        }];
//        self.filteredData = [self.movie filteredArrayUsingPredicate:predicate];

        NSLog(@"%@", self.filteredData);

    }
    else {
        self.filteredData = self.movies;
    }

    [self.collectionView reloadData];

}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    self.searchBar.showsCancelButton = YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    self.searchBar.showsCancelButton = NO;
    self.searchBar.text = @"";
    
    [self.searchBar resignFirstResponder];
    self.filteredData = self.movies;
    [self.collectionView reloadData];
    
}
*/

@end
