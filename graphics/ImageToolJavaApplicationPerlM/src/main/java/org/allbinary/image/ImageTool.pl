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

package org::allbinary::image::ImageTool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub main {
    my ($class, $args) = @_;
        $org::allbinary::image::java::awt->{EventQueue}->invokeLater(do {
            package org::allbinary::thread::ARunnable::AnonymousN65805 { our @ISA = ('org::allbinary::thread::ARunnable');
            

            sub run {
                my ($self) = @_;
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                try {
                    $logUtil->putF($commonStrings->{START}, $self, $commonStrings->{RUN});
                    'org::allbinary::image::gui::ImageToolJFrame'->new()->setVisible(1);
                } catch ($e) {
                    $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
                }
            }
            }
            'org::allbinary::thread::ARunnable::AnonymousN65805'->can('new') ? 'org::allbinary::thread::ARunnable::AnonymousN65805'->new() : bless({}, 'org::allbinary::thread::ARunnable::AnonymousN65805')
        });
}

use org::allbinary::thread::ARunnable;
use org::allbinary::image::gui::ImageToolJFrame;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

