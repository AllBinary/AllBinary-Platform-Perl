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

package org::allbinary::input::automation::module::generic::GenericConfigData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $RELATIVE_PATH = "./";
our $CONFIG_PATH = "modules/configs/";
our $MODULE_RELATIVE_PATH = $org::allbinary::input::automation::module::generic::GenericConfigData::RELATIVE_PATH + $org::allbinary::input::automation::module::generic::GenericConfigData::CONFIG_PATH . "allbinary/input/automation/module/";
our $GAME_MODULE_RELATIVE_PATH = $org::allbinary::input::automation::module::generic::GenericConfigData::MODULE_RELATIVE_PATH . "game/";
our $MMO_GAME_MODULE_RELATIVE_PATH = $org::allbinary::input::automation::module::generic::GenericConfigData::GAME_MODULE_RELATIVE_PATH . "mmog/";
our $FREE_MMO_GAME_MODULE_RELATIVE_PATH = "free/";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

