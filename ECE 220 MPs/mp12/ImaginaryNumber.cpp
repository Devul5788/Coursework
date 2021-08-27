#include "ImaginaryNumber.h"
#include "helper.h"

//netid: danahar2, sg49, sri4

ImaginaryNumber::ImaginaryNumber()
{
     /* Your code here */
    number_type = IMAGINARY;
    magnitude = 0.0;
    phase = 0.0;
    imaginary_component = 0.0;
}

ImaginaryNumber::ImaginaryNumber(double rval)
{
    number_type = IMAGINARY;
    magnitude = abs(rval);
    phase = calculate_phase(0, rval);
    imaginary_component = rval;
}

ImaginaryNumber::ImaginaryNumber( const ImaginaryNumber& other )
{
    /* Your code here */
    number_type = other.get_number_type();
    magnitude = other.get_magnitude(); 
    imaginary_component = other.get_imaginary_component();
    phase = other.get_phase();
}

void ImaginaryNumber::set_imaginary_component (double rval)
{
    imaginary_component = rval; 
    magnitude = abs(rval);
    phase = calculate_phase(0, rval);
}

double ImaginaryNumber::get_imaginary_component() const
{
    return imaginary_component;
}

//Getter function for magnitude
double ImaginaryNumber::get_magnitude() const{
    return magnitude;
}

//Getter function for phase
double ImaginaryNumber::get_phase() const{
    return phase;
}

//Operator Overload
ImaginaryNumber ImaginaryNumber::operator + (const ImaginaryNumber& arg)
{
    return ImaginaryNumber(imaginary_component + arg.get_imaginary_component());
}

ImaginaryNumber ImaginaryNumber::operator - (const ImaginaryNumber& arg)
{
    return ImaginaryNumber(imaginary_component - arg.get_imaginary_component());
}

RealNumber ImaginaryNumber::operator * (const ImaginaryNumber& arg)
{
    return RealNumber(-1 * imaginary_component * arg.get_imaginary_component());
}

RealNumber ImaginaryNumber::operator / (const ImaginaryNumber& arg)
{
    ComplexNumber c1(0, imaginary_component);
    ComplexNumber c2(0, arg.get_imaginary_component());
    ComplexNumber res = c1/c2;

    return RealNumber(res.get_real_component());
}

ComplexNumber ImaginaryNumber::operator + (const RealNumber& arg)
{
    return ComplexNumber(arg.get_real_component(), imaginary_component);
}

ComplexNumber ImaginaryNumber::operator - (const RealNumber& arg)
{
    return ComplexNumber(-1 * arg.get_real_component(), imaginary_component);
}

ImaginaryNumber ImaginaryNumber::operator * (const RealNumber& arg)
{
    return ImaginaryNumber(arg.get_real_component() * imaginary_component);
}

ImaginaryNumber ImaginaryNumber::operator / (const RealNumber& arg)
{
    return ImaginaryNumber(imaginary_component/arg.get_real_component());
}

ComplexNumber ImaginaryNumber::operator + (const ComplexNumber& arg)
{
    return ComplexNumber(arg.get_real_component(), arg.get_imaginary_component() + imaginary_component);
}

ComplexNumber ImaginaryNumber::operator - (const ComplexNumber& arg)
{
    return ComplexNumber(-1 * arg.get_real_component(), imaginary_component - arg.get_imaginary_component() );
}

ComplexNumber ImaginaryNumber::operator * (const ComplexNumber& arg)
{
    ComplexNumber c1(0, imaginary_component);
    ComplexNumber c2(arg.get_real_component(), arg.get_imaginary_component());

    return ComplexNumber(c1 * c2);
}

ComplexNumber ImaginaryNumber::operator / (const ComplexNumber& arg)
{
    ComplexNumber c1(0, imaginary_component);
    ComplexNumber c2(arg.get_real_component(), arg.get_imaginary_component());

    return ComplexNumber(c1/c2);
}

string ImaginaryNumber::to_String(){
    /* Do not modify */
    stringstream my_output;
    my_output << std::setprecision(3) << imaginary_component << 'i';
    return my_output.str();
}