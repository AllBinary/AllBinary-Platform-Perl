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

package org::allbinary::input::automation::robot::osgi::InputAutomationRobotServiceConsumer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::osgi::service::InputAutomationServiceConsumer';



sub new {
    my ($class, $bundleContext) = @_;
    my $self = $class->SUPER::new('bundle::input::automation::robot::InputAutomationRobotServiceInterface'->getName(), $bundleContext, 'org::allbinary::input::automation::robot::osgi::InputAutomationRobotOSGIServiceVisitor'->new());
        # super(...) made $self above
    return $self;
}

use org::osgi::framework::BundleContext;
use bundle::input::automation::robot::InputAutomationRobotServiceInterface;
use org::allbinary::osgi::service::InputAutomationServiceConsumer;
use org::allbinary::input::automation::robot::osgi::InputAutomationRobotOSGIServiceVisitor;

1;

