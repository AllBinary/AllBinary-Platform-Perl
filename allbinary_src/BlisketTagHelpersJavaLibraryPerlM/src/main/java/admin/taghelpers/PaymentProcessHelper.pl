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

package admin::taghelpers::PaymentProcessHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::TagHelper';


sub _init_fields {
    my ($self) = @_;
    $self->{paymentProcessorComponent} = undef;
}


sub new {
    my ($class, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $transformInfoInterface = 'org::allbinary::logic::visual::transform::info::TransformInfoHttpFactory'->getInstance($propertiesHashMap, $pageContext);
        $self->{paymentProcessorComponent} = 'views::admin::payment::PaymentProcessorComponent'->new($transformInfoInterface);
    return $self;
}


# throws Exception
sub process {
    my ($self) = @_;
        return $self->{paymentProcessorComponent}->view();
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpFactory;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface;
use views::admin::payment::PaymentProcessorComponent;
use admin::taghelpers::TagHelper;

1;

