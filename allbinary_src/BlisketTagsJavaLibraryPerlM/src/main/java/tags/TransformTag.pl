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

package tags::TransformTag;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'tags::transform::info::TransformInfoTag';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of TransformTag takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new('taghelpers::ViewHelperFactory'->new());
    $self->_init_fields();
        # super(...) made $self above
        if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


sub _new1 {
    my ($class, $tagHelperFactoryInterface) = @_;
    my $self = $class->SUPER::new($tagHelperFactoryInterface);
    $self->_init_fields();
        # super(...) made $self above
        if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


# throws Exception
sub view {
    my ($self) = @_;
        try {
            my $result = ref($self->getHelper())->getMethod("view", undef)->invoke($self->getHelper(), undef);
            return $result;
        } catch ($e) {
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}


# throws JspTagException
sub doStartTag {
    my ($self) = @_;
        try {
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                $self->{logUtil}->putF("Creating with: \n" . $self->getPropertiesHashMap()->toString(), $self, $self->{tagStrings}->{DO_START_TAG});
            }
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("ViewTag Start For: ");
                $stringBuffer->append($self->getName());
                $stringBuffer->append("\nViewFile: ");
                $stringBuffer->append($self->getObjectFile());
                $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{tagStrings}->{DO_START_TAG});
            }
            $self->setHelper();
            $self->{pageContext}->getOut()->print($self->view());
            if ($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($tags::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{JSPTAG})) {
                $self->{logUtil}->putF("Tag End", $self, $self->{tagStrings}->{DO_START_TAG});
            }
            return $self->{SKIP_BODY};
        } catch ($e) {
            'org::allbinary::logic::communication::http::request::AbResponseHandler'->sendJspTagLicensingRedirect($self->{pageContext}, $e);
            return $self->{SKIP_BODY};
        }
}

# use javax::servlet::jsp::JspTagException;
use admin::taghelpers::TagHelperFactoryInterface;
use org::allbinary::logic::communication::http::request::AbResponseHandler;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::security::licensing::LicensingException;
use taghelpers::ViewHelperFactory;
use tags::transform::info::TransformInfoTag;

1;

