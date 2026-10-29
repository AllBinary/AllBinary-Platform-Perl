# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
#  
# By agreeing to this license you and any business entity you represent are 
# legally bound to the AllBinary Open License Version 1 legal agreement. 
#  
# You may obtain the AllBinary Open License Version 1 legal agreement from 
# AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
#  
# Created By: Travis Berthelot 
#   
# Generated Code Do Not Modify

package javax::microedition::lcdui::ChoiceGroupImageFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'javax::microedition::lcdui::ChoiceGroupImageFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{multiOff} = [((int(-119) + 128) % 256 - 128), 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82, 0, 0, 0, 10, 0, 0, 0, 11, 2, 3, 0, 0, 0, 59, 0, ((int(-12) + 128) % 256 - 128), ((int(-117) + 128) % 256 - 128), 0, 0, 0, 6, 80, 76, 84, 69, ((int(-1) + 128) % 256 - 128), ((int(-1) + 128) % 256 - 128), ((int(-1) + 128) % 256 - 128), ((int(-69) + 128) % 256 - 128), ((int(-69) + 128) % 256 - 128), ((int(-69) + 128) % 256 - 128), ((int(-57) + 128) % 256 - 128), 75, ((int(-33) + 128) % 256 - 128), ((int(-8) + 128) % 256 - 128), 0, 0, 0, 30, 73, 68, 65, 84, 120, ((int(-38) + 128) % 256 - 128), 99, 96, 96, 96, 96, 12, 101, ((int(-8) + 128) % 256 - 128), ((int(-51) + 128) % 256 - 128), ((int(-32) + 128) % 256 - 128), ((int(-64) + 128) % 256 - 128), 32, ((int(-64) + 128) % 256 - 128), ((int(-60) + 128) % 256 - 128), ((int(-64) + 128) % 256 - 128), ((int(-64) + 128) % 256 - 128), ((int(-128) + 128) % 256 - 128), 11, 51, ((int(-122) + 128) % 256 - 128), 50, ((int(-4) + 128) % 256 - 128), 6, 0, 63, 116, 3, 1, 53, ((int(-108) + 128) % 256 - 128), 39, ((int(-26) + 128) % 256 - 128), 0, 0, 0, 0, 73, 69, 78, 68, ((int(-82) + 128) % 256 - 128), 66, 96, ((int(-126) + 128) % 256 - 128)];
    $self->{multiOn} = [((int(-119) + 128) % 256 - 128), 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82, 0, 0, 0, 10, 0, 0, 0, 11, 2, 3, 0, 0, 0, 59, 0, ((int(-12) + 128) % 256 - 128), ((int(-117) + 128) % 256 - 128), 0, 0, 0, 12, 80, 76, 84, 69, ((int(-1) + 128) % 256 - 128), ((int(-1) + 128) % 256 - 128), ((int(-1) + 128) % 256 - 128), ((int(-69) + 128) % 256 - 128), ((int(-69) + 128) % 256 - 128), ((int(-69) + 128) % 256 - 128), 106, 106, 106, 2, 2, 2, 106, ((int(-103) + 128) % 256 - 128), 14, ((int(-47) + 128) % 256 - 128), 0, 0, 0, 53, 73, 68, 65, 84, 120, ((int(-38) + 128) % 256 - 128), 99, 96, 96, 124, ((int(-64) + 128) % 256 - 128), ((int(-16) + 128) % 256 - 128), ((int(-1) + 128) % 256 - 128), ((int(-77) + 128) % 256 - 128), 3, ((int(-45) + 128) % 256 - 128), 65, ((int(-111) + 128) % 256 - 128), 15, 76, 12, 108, 12, 76, 12, ((int(-4) + 128) % 256 - 128), 12, 76, 12, 18, 12, 76, ((int(-68) + 128) % 256 - 128), 127, 24, ((int(-104) + 128) % 256 - 128), 126, 45, 96, 96, ((int(-7) + 128) % 256 - 128), ((int(-11) + 128) % 256 - 128), ((int(-109) + 128) % 256 - 128), ((int(-127) + 128) % 256 - 128), ((int(-23) + 128) % 256 - 128), ((int(-65) + 128) % 256 - 128), 3, 3, ((int(-29) + 128) % 256 - 128), 127, ((int(-122) + 128) % 256 - 128), ((int(-113) + 128) % 256 - 128), 0, 5, 37, 12, ((int(-34) + 128) % 256 - 128), 1, ((int(-99) + 128) % 256 - 128), ((int(-83) + 128) % 256 - 128), 100, 0, 0, 0, 0, 73, 69, 78, 68, ((int(-82) + 128) % 256 - 128), 66, 96, ((int(-126) + 128) % 256 - 128)];
    $self->{radioOff} = [((int(-119) + 128) % 256 - 128), 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82, 0, 0, 0, 11, 0, 0, 0, 11, 2, 3, 0, 0, 0, ((int(-44) + 128) % 256 - 128), ((int(-62) + 128) % 256 - 128), ((int(-97) + 128) % 256 - 128), ((int(-75) + 128) % 256 - 128), 0, 0, 0, 9, 80, 76, 84, 69, ((int(-1) + 128) % 256 - 128), ((int(-1) + 128) % 256 - 128), ((int(-1) + 128) % 256 - 128), ((int(-69) + 128) % 256 - 128), ((int(-69) + 128) % 256 - 128), ((int(-69) + 128) % 256 - 128), 106, 106, 106, ((int(-44) + 128) % 256 - 128), 13, ((int(-1) + 128) % 256 - 128), ((int(-24) + 128) % 256 - 128), 0, 0, 0, 42, 73, 68, 65, 84, 120, ((int(-38) + 128) % 256 - 128), 99, 96, 90, ((int(-59) + 128) % 256 - 128), ((int(-64) + 128) % 256 - 128), 32, ((int(-63) + 128) % 256 - 128), 48, ((int(-127) + 128) % 256 - 128), 65, ((int(-127) + 128) % 256 - 128), 65, ((int(-127) + 128) % 256 - 128), 41, ((int(-127) + 128) % 256 - 128), ((int(-31) + 128) % 256 - 128), 5, 19, 3, 3, 3, 50, 102, 80, 96, 80, 96, ((int(-6) + 128) % 256 - 128), ((int(-63) + 128) % 256 - 128), 80, ((int(-64) + 128) % 256 - 128), ((int(-64) + 128) % 256 - 128), ((int(-76) + 128) % 256 - 128), ((int(-118) + 128) % 256 - 128), 1, 0, 113, 24, 5, 61, 73, ((int(-68) + 128) % 256 - 128), ((int(-100) + 128) % 256 - 128), 98, 0, 0, 0, 0, 73, 69, 78, 68, ((int(-82) + 128) % 256 - 128), 66, 96, ((int(-126) + 128) % 256 - 128)];
    $self->{radioOn} = [((int(-119) + 128) % 256 - 128), 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 13, 73, 72, 68, 82, 0, 0, 0, 11, 0, 0, 0, 11, 2, 3, 0, 0, 0, ((int(-44) + 128) % 256 - 128), ((int(-62) + 128) % 256 - 128), ((int(-97) + 128) % 256 - 128), ((int(-75) + 128) % 256 - 128), 0, 0, 0, 12, 80, 76, 84, 69, ((int(-1) + 128) % 256 - 128), ((int(-1) + 128) % 256 - 128), ((int(-1) + 128) % 256 - 128), ((int(-69) + 128) % 256 - 128), ((int(-69) + 128) % 256 - 128), ((int(-69) + 128) % 256 - 128), 106, 106, 106, 2, 2, 2, 106, ((int(-103) + 128) % 256 - 128), 14, ((int(-47) + 128) % 256 - 128), 0, 0, 0, 50, 73, 68, 65, 84, 120, ((int(-38) + 128) % 256 - 128), 5, ((int(-63) + 128) % 256 - 128), 65, 13, 0, 32, 12, 4, ((int(-63) + 128) % 256 - 128), ((int(-19) + 128) % 256 - 128), ((int(-11) + 128) % 256 - 128), ((int(-117) + 128) % 256 - 128), 1, 18, 68, ((int(-100) + 128) % 256 - 128), 10, 52, 19, 94, 72, 64, 17, 101, ((int(-122) + 128) % 256 - 128), 44, ((int(-44) + 128) % 256 - 128), ((int(-29) + 128) % 256 - 128), 98, ((int(-52) + 128) % 256 - 128), 89, 77, ((int(-102) + 128) % 256 - 128), 40, 2, 85, ((int(-95) + 128) % 256 - 128), ((int(-73) + 128) % 256 - 128), ((int(-63) + 128) % 256 - 128), ((int(-104) + 128) % 256 - 128), ((int(-63) + 128) % 256 - 128), 37, ((int(-117) + 128) % 256 - 128), 15, ((int(-40) + 128) % 256 - 128), 119, 10, 41, 78, 26, ((int(-79) + 128) % 256 - 128), 59, 0, 0, 0, 0, 73, 69, 78, 68, ((int(-82) + 128) % 256 - 128), 66, 96, ((int(-126) + 128) % 256 - 128)];
    $self->{imgMultiOffO} = 'javax::microedition::lcdui::Image'->createImage($self->{multiOff}, 0, scalar(@{$self->{multiOff}}));
    $self->{imgMultiOnO} = 'javax::microedition::lcdui::Image'->createImage($self->{multiOn}, 0, scalar(@{$self->{multiOn}}));
    $self->{imgRadioOffO} = 'javax::microedition::lcdui::Image'->createImage($self->{radioOff}, 0, scalar(@{$self->{radioOff}}));
    $self->{imgRadioOnO} = 'javax::microedition::lcdui::Image'->createImage($self->{radioOn}, 0, scalar(@{$self->{radioOn}}));
    $self->{imgMultiOff} = $self->{imgMultiOffO};
    $self->{imgMultiOn} = $self->{imgMultiOnO};
    $self->{imgRadioOff} = $self->{imgRadioOffO};
    $self->{imgRadioOn} = $self->{imgRadioOnO};
    $self->{imageArray} = [$self->{imgMultiOff}, $self->{imgMultiOn}, $self->{imgRadioOff}, $self->{imgRadioOn}];
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $javax::microedition::lcdui::ChoiceGroupImageFactory::instance;
}


sub getImageArray {
    my ($self) = @_;
        return $self->{imageArray};
}


sub init {
    my ($self, $imageArray) = @_;
        $self->{imgMultiOff} = $imageArray->[0];
        $self->{imageArray}->[0] = $self->{imgMultiOff};
        $self->{imgMultiOn} = $imageArray->[1];
        $self->{imageArray}->[1] = $self->{imgMultiOn};
        $self->{imgRadioOff} = $imageArray->[2];
        $self->{imageArray}->[2] = $self->{imgRadioOff};
        $self->{imgRadioOn} = $imageArray->[3];
        $self->{imageArray}->[3] = $self->{imgRadioOn};
}

use javax::microedition::lcdui::Image;

1;

