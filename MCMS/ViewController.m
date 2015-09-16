//
//  ViewController.m
//  MCMS
//
//  Created by Edil Ashimov on 7/21/15.
//  Copyright (c) 2015 Edil Ashimov. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];



    //Objects described in detail
    MagicalCreature * onyx = [MagicalCreature new];
    onyx.name = @"Onyx";
    onyx.descriptionText = @"Stone Snake";
    MagicalCreature * pikachu = [MagicalCreature new];
    pikachu.name = @"Pikcachu";
    pikachu.descriptionText = @"Great Warrior";
    MagicalCreature * robot = [MagicalCreature new];
    robot.name = @"Robot";
    robot.descriptionText = @"Terminator made of steel";
    MagicalCreature * mario = [MagicalCreature new];
    mario.name = @"Mario";
    mario.descriptionText = @"Wise Mexican Andventurer";


    //Refers To NSMutableArray
    self.creatures = [NSMutableArray arrayWithObjects: onyx, mario, robot, pikachu, nil];
}

//return the number of rows in a given section of a table view
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}

- (IBAction)whenButtonPressed:(id)sender {
    MagicalCreature *newCreatures = [MagicalCreature new];
    newCreatures.name = self.textField.text;
    [self.creatures addObject: newCreatures];
    [self.tableView reloadData];
    self.textField.text = @"";
    [self.textField resignFirstResponder];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellId"];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.descriptionText;
    return cell;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    CreatureViewController *dvc = segue.destinationViewController;
    dvc.creature = [self.creatures objectAtIndex: [self.tableView indexPathForSelectedRow].row];
}
@end
