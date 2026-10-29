# Generated Code Do Not Modify

package org::allbinary::android::ToastUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::android::ToastUtil'->new();

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


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::android::ToastUtil::instance;
}


sub makeToast {
    my ($self, $view, $context, $message, $time) = @_;
        {
        package org::allbinary::android::MakeToast;
        use strict;
        use warnings;
        use feature 'try';
        no warnings 'experimental::try';
        

        sub _init_fields {
            my ($self) = @_;
            $self->{string} = undef;
        }
        

        sub new {
            my ($class, $string) = @_;
            my $self = bless({}, $class);
            $self->_init_fields();
                $self->{string} = $string;
            return $self;
        }
        

        sub run {
            my ($self) = @_;
                my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                try {
                    'android::widget::Toast'->makeText($self->{context}, $self->{string}, $self->{time})->show();
                } catch ($e) {
                    my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                    $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
                }
        }
        }

        $view->post('org::allbinary::android::MakeToast'->new($message));
}

use android::content::Context;
use android::view::View;
use android::widget::Toast;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

