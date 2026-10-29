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

package org::allbinary::android::input::api3::HideVirtualKeyboardRunnable;
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
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        try {
            my $inputMethodManager = $self->{activity}->getSystemService($android::content::Context::INPUT_METHOD_SERVICE);
            my $viewCompositeInterface = $self->{activity};
            if (!defined($viewCompositeInterface)) {
                'org::allbinary::logic::communication::log::ForcedLogUtil'->log("Activity Null", $self);
            }
            my $view = $viewCompositeInterface->getView();
            if (!defined($view->getWindowToken())) {
                $self->{logUtil}->putF("Unable to hide virtual keyboard as window token is null - This usually happens during loading when the view is not attached to a window", $self, $commonStrings->{RUN});
                return;
            }
            my $token = $view->getWindowToken();
            $inputMethodManager->hideSoftInputFromWindow($token, 0);
        } catch ($e) {
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
        }
}

use android::app::Activity;
use android::content::Context;
use android::os::IBinder;
use android::view::View;
use android::view::inputmethod::InputMethodManager;
use org::allbinary::android::activity::ViewCompositeInterface;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

