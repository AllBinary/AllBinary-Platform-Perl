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

package org::allbinary::android::input::api3::ShowVirtualKeyboardRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{activity} = undef;
}


sub new {
    my ($class, $activity) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{activity} = $activity;
    return $self;
}


sub run {
    my ($self) = @_;
        try {
            my $inputMethodManager = $self->{activity}->getSystemService($android::content::Context::INPUT_METHOD_SERVICE);
            my $viewCompositeInterface = $self->{activity};
            if (!defined($viewCompositeInterface)) {
                'org::allbinary::logic::communication::log::ForcedLogUtil'->log("Activity Null", $self);
            }
            my $view = $viewCompositeInterface->getView();
            $inputMethodManager->toggleSoftInputFromWindow($view->getWindowToken(), $android::view::inputmethod::InputMethodManager::SHOW_FORCED, 0);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
        }
}

use android::app::Activity;
use android::content::Context;
use android::view::View;
use android::view::inputmethod::InputMethodManager;
use org::allbinary::android::activity::ViewCompositeInterface;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

