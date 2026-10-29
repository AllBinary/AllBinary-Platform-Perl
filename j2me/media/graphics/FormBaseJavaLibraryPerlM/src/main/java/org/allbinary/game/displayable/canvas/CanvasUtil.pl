#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
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

package org::allbinary::game::displayable::canvas::CanvasUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getKeyName {
    my ($class, $key) = @_;
        my $commonPhoneStrings = 'org::allbinary::string::CommonPhoneStrings'->getInstance();
        if ($key == $javax::microedition::lcdui::Canvas::UP) {
            return $commonPhoneStrings->{UP};
        } elsif ($key == $javax::microedition::lcdui::Canvas::DOWN) {
            return $commonPhoneStrings->{DOWN};
        } elsif ($key == $javax::microedition::lcdui::Canvas::RIGHT) {
            return $commonPhoneStrings->{RIGHT};
        } elsif ($key == $javax::microedition::lcdui::Canvas::LEFT) {
            return $commonPhoneStrings->{LEFT};
        } elsif ($key == $javax::microedition::lcdui::Canvas::FIRE) {
            return $commonPhoneStrings->{FIRE};
        }
        return "UNKNOWN KEY";
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::string::CommonPhoneStrings;

1;

