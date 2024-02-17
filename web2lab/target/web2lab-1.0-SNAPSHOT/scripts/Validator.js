export default class Validator {
    static regex = /^-?\d+(\.\d+)?$/;

    static isValid(x, y, r) {
        return this.isValidX(x) && this.isValidY(y) && this.isValidR(r)
    }

    static isValidR(val) {
        return val.length !== 0;
    }

    static isValidX(val) {
        if (Number(val) === undefined) {
            return false;
        }
        if (Number(val) === 0) {
            return true
        }

        if (!Number(val)) {
            return false
        }
        return !(!Number(val) < -5 || !Number(val) > 5);

    }

    static isValidY(val) {
        if (Number(val) === 0) {
            return true
        }
        if (!Number(val)) {
            return false
        }
        return !(!Number(val) < -5 || !Number(val) > 5);
    }
}
