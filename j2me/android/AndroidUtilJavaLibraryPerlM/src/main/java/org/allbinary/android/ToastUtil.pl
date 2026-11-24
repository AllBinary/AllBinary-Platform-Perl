# Generated Code Do Not Modify

package org::allbinary::android::ToastUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::android::ToastUtil'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::android::ToastUtil::instance;
}


sub makeToast {
    my ($self, $view, $context, $message, $time) = @_;
        $view->post('org::allbinary::android::MakeToast'->new($context, $message, $time));
}
{
    #A member class instead of a local class using the method parameters since most of the converted languages do not have local classes.
    package org::allbinary::android::MakeToast;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'java::lang::Object';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{context} = undef;
        $self->{string} = undef;
        $self->{time} = undef;
    }
    

    sub new {
        my ($class, $context, $string, $time) = @_;
        my $self = bless({}, $class);
        _init_fields($self);
            $self->{context} = $context;
            $self->{string} = $string;
            $self->{time} = $time;
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


use java::lang::Object ();
use java::lang::LazyStatic ();
# use android::content::Context ();
# use android::view::View ();
# use android::widget::Toast ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::string::CommonStrings ();

1;

