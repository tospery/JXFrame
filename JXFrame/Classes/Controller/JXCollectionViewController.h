//
//  JXCollectionViewController.h
//  Pods
//
//  Created by 杨建祥 on 2019/12/30.
//

#import "JXScrollViewController.h"
#import "JXCollectionViewModel.h"

@interface JXCollectionViewController : JXScrollViewController <JXCollectionViewModelDelegate, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong, readonly) UICollectionView *collectionView;

- (UICollectionViewLayout *)collectionViewLayout;

@end

