//
//  CreatureViewController.m
//  MCMS
//
//  Created by Edil Ashimov on 7/21/15.
//  Copyright (c) 2015 Edil Ashimov. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"
@interface CreatureViewController ()
@property (weak, nonatomic) IBOutlet UITextField *editCreatureNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *editCreatureDetailTextField;
@property (weak, nonatomic) IBOutlet UILabel *creatureDescritionLabel;
@property (weak, nonatomic) IBOutlet UILabel *creatureNameLabel;

@property BOOL inEditMode;
@end

@implementation CreatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.inEditMode = NO;
    self.editCreatureNameTextField.text = self.creature.name;
    self.editCreatureDetailTextField.text = self.creature.descriptionText;

}

@end