// *************************************************************
// project:  Bobs Fishing Calculator!!
// *************************************************************

namespace BobsFishing.Calculator.Extended
{
    using BobsFishing.Calculator;

    public class BobsExtendedFishingCalculator : BobsFishingCalculator
    {
        /// <summary>
        /// Divides two numbers.
        /// </summary>
        /// <param name="a">the first number.</param>
        /// <param name="b">The number to divide by.</param>
        /// <returns>System.Int32.</returns>
        public int Divide(int a, int b)
        {
            return a / b;
        }
    }
}